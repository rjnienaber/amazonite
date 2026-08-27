require "json"

module Amazonite::Codegen::Service
  # Translates a Smithy JSON AST service model (aws/api-models-aws) into the
  # same JSON shape that Description/Metadata/Operation/Member/Shape already
  # parse (the old aws-sdk-js `.normal.json` schema), so the existing,
  # unmodified parsing/rendering pipeline can consume either source.
  class SmithyTranslator
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

    private def build_metadata(json : JSON::Builder)
      service_info = @service_shape["traits"]["aws.api#service"].as_h

      json.object do
        json.field "apiVersion", @api_version
        json.field "endpointPrefix", service_info["endpointPrefix"].as_s
        json.field "protocol", "json"
        json.field "signatureVersion", "v4"
        json.field "jsonVersion", aws_json_version
        json.field "serviceId", service_info["sdkId"].as_s
        json.field "targetPrefix", local_name(@service_id)
      end
    end

    # awsJson1_0/1_1 is the only protocol these two target services use, and
    # the trait carries no explicit version field - it's encoded in the trait
    # name itself (e.g. "aws.protocols#awsJson1_0" -> "1.0").
    private def aws_json_version : String
      traits = @service_shape["traits"].as_h
      trait_name = traits.keys.find(&.starts_with?("aws.protocols#awsJson"))
      unless trait_name
        raise Exception.new("service '#{@service_id}' does not use the awsJson protocol")
      end
      trait_name.split("awsJson").last.sub('_', '.')
    end

    private def build_operations(json : JSON::Builder)
      operation_refs = @service_shape["operations"]?.try(&.as_a) || [] of JSON::Any

      json.object do
        operation_refs.each do |ref|
          target = ref["target"].as_s
          name = local_name(target)
          json.field(name) { build_operation(json, name, @shapes[target]) }
        end
      end
    end

    private def build_operation(json : JSON::Builder, name : String, op_shape : JSON::Any)
      json.object do
        json.field "name", name
        json.field "http" do
          json.object do
            json.field "method", "POST"
            json.field "requestUri", "/"
            json.field "responseCode", 200
          end
        end

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
              errors.each do |error|
                json.object { json.field "shape", local_name(error["target"].as_s) }
              end
            end
          end
        end
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
