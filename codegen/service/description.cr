require "./shape"

module Amazonite::Codegen::Service
  class Description
    private KNOWN_KEYS = ["version", "metadata", "operations", "shapes", "documentation",
                          "deprecated", "deprecatedMessage"]

    @operations_map = {} of String => Operation
    @operations = [] of Operation
    @resolver : ShapeResolver
    @error_names : Array(String)?
    @error_refs : Array(Operation::ErrorRef)?
    @lower_name : String?
    @module_name : String?
    @module_alias : String?
    @service_id : String

    getter aws_version, api_version, version, lower_version, metadata, resolver
    property operations

    def initialize(@aws_version : String, @api_version : String, @version_number : String, json : JSON::Any)
      Utils.verify_keys(KNOWN_KEYS, json)

      @metadata = Metadata.new(json["metadata"])

      version_match = @metadata.service_id.split(/(?=[vV]\d+$)/)
      if version_match.size > 1
        @service_id, version_part = version_match
        # The split's lookahead only consumes up to the version suffix
        # itself, so a serviceId like "Elastic Load Balancing v2" (name and
        # suffix separated by a space) leaves that trailing space on
        # @service_id - strip it so lower_name (used to build file/module
        # paths) doesn't end up with a stray double underscore.
        @service_id = @service_id.strip
        @version = version_part.upcase
      else
        @service_id = version_match[0]
        @version = "V#{@version_number}"
      end
      @lower_version = @version.downcase

      json["operations"].as_h.each do |k, v|
        operation = Operation.new(v)
        @operations_map[k] = operation
        operations << operation
      end
      @resolver = ShapeResolver.load_json(json["shapes"])
    end

    def lower_name
      @lower_name ||= @service_id.gsub(" ", "_").downcase
    end

    def has_errors
      !error_names.empty?
    end

    def error_names
      @error_names ||= error_refs.map(&.name)
    end

    def error_refs
      @error_refs ||= @operations.flat_map(&.errors).uniq!(&.name).sort_by!(&.name)
    end

    def error_codes
      error_refs.to_h { |error| {error.name, error.code} }
    end

    def find_operation(operation_name)
      @operations_map[operation_name]
    end

    def enums
      @resolver.shapes.select(Service::Enum).map { |shape| shape.as(Service::Enum) }
    end

    def structures
      @resolver.shapes.select(Service::Structure).map { |shape| shape.as(Service::Structure) }
    end

    def module_name
      return @module_name.as(String) if @module_name
      @module_name = "Amazonite::#{name}#{version}"
    end

    def module_alias
      return @module_alias.as(String) if @module_alias
      @module_alias = module_name.gsub(/[vV]\d+$/, "").scan(/[A-Z]/).map(&.[0]).join
    end

    private def name
      name = @service_id.split(" ").map do |part|
        /^[A-Z]+$/.matches?(part) ? part[0] + part[1..].downcase : part
      end.join

      name[0].upcase + name[1..]
    end
  end
end
