require "./shape"

module Amazonite::Codegen::Service
  class Description
    private KNOWN_KEYS = ["version", "metadata", "operations", "shapes", "documentation"]

    @operations_map : Hash(String, Operation)
    @operations : Array(Operation)
    @resolver : ShapeResolver

    getter aws_version, metadata, operations, resolver

    def initialize(@aws_version : String, json : JSON::Any)
      Utils.verify_keys(KNOWN_KEYS, json)
      version = json["version"]
      raise Exception.new("unknown version document: #{version}") unless version == "2.0"
      @metadata = Metadata.new(json["metadata"])
      @operations = [] of Operation
      @operations_map = {} of String => Operation
      json["operations"].as_h.each do |k, v|
        operation = Operation.new(v)
        @operations_map[k] = operation
        operations << operation
      end
      @resolver = ShapeResolver.load_json(@metadata.service_id, json["shapes"])
    end

    def find_operation(operation_name)
      @operations_map[operation_name]
    end

    def enums
      @resolver.shapes.select { |s| s.is_a?(Service::Enum) }.map { |s| s.as(Service::Enum) }
    end

    def structures
      @resolver.shapes.select { |s| s.is_a?(Service::Structure) }.map { |s| s.as(Service::Structure) }
    end
  end
end
