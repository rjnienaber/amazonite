require "./shape"

module Amazonite::Codegen::Service
  class Description
    private KNOWN_KEYS = ["version", "metadata", "operations", "shapes", "documentation"]

    @operations_map = {} of String => Operation
    @operations = [] of Operation
    @resolver : ShapeResolver
    @error_names : Array(String) | Nil
    @lower_name : String | Nil
    @module_name : String | Nil
    @module_alias : String | Nil
    @service_id : String

    getter aws_version, api_version, version, lower_version, metadata, resolver
    property operations

    def initialize(@aws_version : String, @api_version : String, @version_number : String, json : JSON::Any)
      Utils.verify_keys(KNOWN_KEYS, json)

      @metadata = Metadata.new(json["metadata"])

      version_match = @metadata.service_id.split(/(?=[vV]\d+$)/)
      if version_match.size > 1
        @service_id, version_part = version_match
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
