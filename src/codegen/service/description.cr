require "./shape"

module Amazonite::Codegen::Service
  class Description
    private KNOWN_KEYS = ["version", "metadata", "operations", "shapes", "documentation"]

    @operations_map = {} of String => Operation
    @operations = [] of Operation
    @resolver : ShapeResolver
    @error_names : Array(String) | Nil
    @module_alias : String | Nil

    getter aws_version, api_version, version, metadata, resolver
    property operations

    def initialize(@aws_version : String, @api_version : String, @version : String, json : JSON::Any)
      Utils.verify_keys(KNOWN_KEYS, json)
      version = json["version"]
      raise Exception.new("unknown version document: #{version}") unless version == "2.0"

      @metadata = Metadata.new(json["metadata"])
      json["operations"].as_h.each do |k, v|
        operation = Operation.new(v)
        @operations_map[k] = operation
        operations << operation
      end
      @resolver = ShapeResolver.load_json(json["shapes"])
    end

    def lower_name
      @metadata.service_id.downcase
    end

    def has_errors
      !error_names.empty?
    end

    def error_names
      @error_names ||= @operations.flat_map(&.errors).uniq!.sort!
    end

    def find_operation(operation_name)
      @operations_map[operation_name]
    end

    def enums
      @resolver.shapes.select(Service::Enum).map { |s| s.as(Service::Enum) }
    end

    def structures
      @resolver.shapes.select(Service::Structure).map { |s| s.as(Service::Structure) }
    end

    def module_name
      "Amazonite::#{@metadata.service_id}#{@version}"
    end

    def module_alias
      @module_alias ||= module_name.scan(/[A-Z]/).map(&.[0]).join
    end
  end
end
