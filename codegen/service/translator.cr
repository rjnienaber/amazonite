require "json"

module Amazonite::Codegen::Service
  # Translates a Smithy JSON AST service model (aws/api-models-aws) into the
  # JSON shape that Description/Metadata/Operation/Member/Shape parse, so the
  # rest of the pipeline stays unchanged regardless of the Smithy source's
  # own layout.
  class Translator
    getter api_version

    @service_id : String
    @service_shape : JSON::Any

    def initialize(@smithy_json : JSON::Any)
      @shapes = @smithy_json["shapes"].as_h
      service_entry = @shapes.find { |_, shape| shape["type"].as_s == "service" }
      raise Exception.new("no service shape found in Smithy model") unless service_entry
      @service_id, @service_shape = service_entry
      @api_version = @service_shape["version"].as_s
    end

    def translate : JSON::Any
      JSON.parse(build_json)
    end

    private def build_json : String
      JSON.build do |json|
        json.object do
          json.field "version", @api_version
          json.field "metadata" { build_metadata(json) }
          json.field "operations" { build_operations(json) }
          json.field "shapes" { build_shapes(json) }
        end
      end
    end

    # Smithy protocol trait name => old-format metadata.protocol value,
    # matching the strings aws-sdk-js itself used. Full request/response
    # rendering (client.cr.j2 etc.) is only exercised for awsJson services -
    # the rest are translated just far enough for metadata/naming to resolve.
    PROTOCOLS = {
      "awsQuery"  => "query",
      "ec2Query"  => "ec2",
      "restJson1" => "rest-json",
      "restXml"   => "rest-xml",
    }

    private def build_metadata(json : JSON::Builder)
      service_info = @service_shape["traits"]["aws.api#service"].as_h

      json.object do
        json.field "apiVersion", @api_version
        json.field "endpointPrefix", service_info["endpointPrefix"].as_s
        json.field "protocol", protocol
        json.field "signatureVersion", "v4"
        json.field "jsonVersion", aws_json_version if aws_json?
        json.field "serviceId", service_info["sdkId"].as_s
        json.field "targetPrefix", local_name(@service_id)
      end
    end

    private def aws_json?
      protocol_trait_name.starts_with?("aws.protocols#awsJson")
    end

    private def protocol : String
      return "json" if aws_json?

      name = protocol_trait_name.sub("aws.protocols#", "")
      PROTOCOLS.fetch(name) { raise Exception.new("service '#{@service_id}' uses unsupported protocol '#{name}'") }
    end

    private def protocol_trait_name : String
      traits = @service_shape["traits"].as_h
      trait_name = traits.keys.find(&.starts_with?("aws.protocols#"))
      raise Exception.new("service '#{@service_id}' has no aws.protocols trait") unless trait_name
      trait_name
    end

    # awsJson1_0/1_1 carries no explicit version field - it's encoded in the
    # trait name itself (e.g. "aws.protocols#awsJson1_0" -> "1.0").
    private def aws_json_version : String
      protocol_trait_name.split("awsJson").last.sub('_', '.')
    end

    private def build_operations(json : JSON::Builder)
      operation_refs = collect_operation_refs(@service_shape)

      json.object do
        operation_refs.each do |ref|
          target = ref["target"].as_s
          name = local_name(target)
          json.field(name) { build_operation(json, name, @shapes[target]) }
        end
      end
    end

    # Some services (e.g. Lambda) attach most of their operations to
    # Smithy resource shapes rather than listing them directly on the
    # service - a resource carries its own "operations"/"collectionOperations"
    # lists plus singular lifecycle refs (put/create/read/update/delete/list),
    # and can nest further sub-resources the same way, so this walks the
    # whole service/resource tree to find every operation.
    private def collect_operation_refs(shape : JSON::Any) : Array(JSON::Any)
      refs = [] of JSON::Any
      refs.concat(shape["operations"]?.try(&.as_a) || [] of JSON::Any)
      refs.concat(shape["collectionOperations"]?.try(&.as_a) || [] of JSON::Any)
      {"put", "create", "read", "update", "delete", "list"}.each do |key|
        ref = shape[key]?
        refs << ref if ref
      end

      resource_refs = shape["resources"]?.try(&.as_a) || [] of JSON::Any
      resource_refs.each do |resource_ref|
        refs.concat(collect_operation_refs(@shapes[resource_ref["target"].as_s]))
      end

      refs
    end

    private def build_operation(json : JSON::Builder, name : String, op_shape : JSON::Any)
      json.object do
        json.field "name", name
        json.field("http") { build_http(json, name, op_shape) }

        input_target = op_shape["input"]?.try(&.["target"]?).try(&.as_s)
        if input_target && input_target != "smithy.api#Unit"
          json.field("input") { json.object { json.field "shape", local_name(input_target) } }
        end

        output_target = op_shape["output"]?.try(&.["target"]?).try(&.as_s)
        if output_target && output_target != "smithy.api#Unit"
          json.field("output") { json.object { json.field "shape", local_name(output_target) } }
        end

        errors = op_shape["errors"]?.try(&.as_a) || [] of JSON::Any
        unless errors.empty?
          json.field "errors" do
            json.array do
              errors.each { |error| build_error_ref(json, error) }
            end
          end
        end
      end
    end

    # awsQuery services identify an error by a distinct "code" string carried
    # on the error shape's own aws.protocols#awsQueryError trait, which can
    # differ from the shape's own name (e.g. NotFoundException's code is
    # "NotFound") - captured here (only for awsQuery services) so the
    # generated ExceptionFactory can dispatch on the code actually seen on
    # the wire. Some shapes shared across AWS's error catalog carry this
    # trait even when used by a non-query service (e.g. DynamoDB's own
    # ThrottlingException) - it must be ignored there, since a non-query
    # service's wire error identifier is always its plain shape name.
    private def build_error_ref(json : JSON::Builder, error : JSON::Any)
      target = error["target"].as_s
      error_shape = @shapes[target]
      code = protocol == "query" ? error_shape["traits"]?.try(&.["aws.protocols#awsQueryError"]?).try(&.["code"]?.try(&.as_s)) : nil

      json.object do
        json.field "shape", local_name(target)
        json.field "queryErrorCode", code if code
      end
    end

    private def build_http(json : JSON::Builder, name : String, op_shape : JSON::Any)
      http_trait = op_shape["traits"]?.try(&.["smithy.api#http"]?)
      method = http_trait.try(&.["method"]?.try(&.as_s)) || "POST"
      uri = http_trait.try(&.["uri"]?.try(&.as_s)) || "/"
      raise Exception.new("operation '#{name}' uses an unsupported greedy URI label: '#{uri}'") if uri.includes?("+}")
      code = http_trait.try(&.["code"]?.try(&.as_i)) || 200

      json.object do
        json.field "method", method
        json.field "requestUri", uri
        json.field "responseCode", code
      end
    end

    private def build_shapes(json : JSON::Builder)
      json.object do
        @shapes.each do |id, shape|
          type = shape["type"].as_s
          next if {"service", "operation", "resource"}.includes?(type)
          # Old-format `.normal.json` never carries named shape entries for
          # errors - operations just list the error name and the exception
          # factory template emits a bare `class X < Core::ResponseException`
          # for it. Smithy models errors as full named structures (with a
          # `smithy.api#error` trait), so skip those here to match: emitting
          # them would generate a second, conflicting `class X` definition.
          next if shape["traits"]?.try(&.["smithy.api#error"]?)

          json.field(local_name(id)) { build_shape(json, type, shape) }
        end
      end
    end

    private def build_shape(json : JSON::Builder, type : String, shape : JSON::Any)
      case type
      when "enum"
        build_enum_shape(json, shape)
      when "structure", "union"
        # Smithy unions are the modern replacement for the old format's pattern of a
        # structure with every member optional (see e.g. DynamoDB's AttributeValue) -
        # translating a union the same way as a structure (no required members)
        # reproduces that exact old-format shape.
        build_structure_shape(json, shape)
      when "list"
        build_list_shape(json, shape)
      when "map"
        build_map_shape(json, shape)
      when "string", "boolean", "timestamp", "integer", "long", "float", "double", "blob"
        build_primitive_shape(json, type, shape)
      else
        raise Exception.new("unhandled Smithy shape type: '#{type}'")
      end
    end

    private def build_enum_shape(json : JSON::Builder, shape : JSON::Any)
      json.object do
        json.field "type", "string"
        json.field "enum" do
          json.array do
            shape["members"].as_h.each_value do |member|
              json.string member["traits"]["smithy.api#enumValue"].as_s
            end
          end
        end
        add_documentation(json, shape)
      end
    end

    private def build_structure_shape(json : JSON::Builder, shape : JSON::Any)
      members = shape["members"]?.try(&.as_h) || {} of String => JSON::Any
      required = members.select { |_, member| required?(member) }.keys
      payload_member = members.find { |_, member| member["traits"]?.try(&.["smithy.api#httpPayload"]?) }.try(&.[0])

      json.object do
        json.field "type", "structure"
        json.field "members" do
          json.object do
            members.each do |member_name, member|
              json.field(member_name) { build_member_ref(json, member) }
            end
          end
        end
        unless required.empty?
          json.field "required" { json.array { required.each { |name| json.string name } } }
        end
        json.field "payload", payload_member if payload_member
        add_documentation(json, shape)
      end
    end

    private def build_list_shape(json : JSON::Builder, shape : JSON::Any)
      json.object do
        json.field "type", "list"
        json.field("member") { build_member_ref(json, shape["member"]) }
      end
    end

    private def build_map_shape(json : JSON::Builder, shape : JSON::Any)
      json.object do
        json.field "type", "map"
        json.field("key") { build_member_ref(json, shape["key"]) }
        json.field("value") { build_member_ref(json, shape["value"]) }
      end
    end

    private def build_primitive_shape(json : JSON::Builder, type : String, shape : JSON::Any)
      json.object do
        json.field "type", type
        add_documentation(json, shape)
      end
    end

    private def build_member_ref(json : JSON::Builder, member : JSON::Any)
      json.object do
        json.field "shape", local_name(member["target"].as_s)

        traits = member["traits"]?
        if traits
          if traits["smithy.api#httpLabel"]?
            json.field "location", "uri"
          elsif query_name = traits["smithy.api#httpQuery"]?.try(&.as_s)
            json.field "location", "querystring"
            json.field "locationName", query_name
          elsif header_name = traits["smithy.api#httpHeader"]?.try(&.as_s)
            json.field "location", "header"
            json.field "locationName", header_name
          elsif traits["smithy.api#httpResponseCode"]?
            json.field "location", "statusCode"
          elsif xml_name = traits["smithy.api#xmlName"]?.try(&.as_s)
            # awsQuery/restXml use the member's own Smithy name as its wire
            # name (query param / XML element) unless overridden here - no
            # "location" is set since this isn't an http-binding trait.
            json.field "locationName", xml_name
          end
        end

        add_documentation(json, member)
      end
    end

    private def add_documentation(json : JSON::Builder, node : JSON::Any)
      doc = node["traits"]?.try(&.["smithy.api#documentation"]?).try(&.as_s)
      json.field "documentation", doc if doc
    end

    private def required?(member : JSON::Any) : Bool
      !!member["traits"]?.try(&.["smithy.api#required"]?)
    end

    private def local_name(shape_id : String) : String
      shape_id.split('#', 2)[1]
    end
  end
end
