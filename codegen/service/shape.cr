module Amazonite::Codegen::Service
  class Shape
    private KNOWN_KEYS = ["type", "members", "documentation", "enum", "required", "member",
                          "key", "value", "max", "min", "pattern", "box", "sensitive",
                          "deprecated", "deprecatedMessage", "exception", "fault", "union", "document",
                          "timestampFormat", "wrapper", "locationName", "xmlOrder", "flattened"]

    getter name, type, documentation

    def initialize(name : String, json : JSON::Any)
      Utils.verify_keys(KNOWN_KEYS, json)
      @name = name[0].upcase + name[1..]
      @type = json["type"].as_s
      @documentation = json["documentation"]? ? json["documentation"].as_s : nil
    end

    def snake_case_name
      Utils.snake_case_name(self.name)
    end

    def list?
      type == "list"
    end

    def primitive?
      ShapeResolver::KNOWN_PRIMITIVE_TYPES.includes?(type) && !enum?
    end

    def enum?
      is_a?(Service::Enum)
    end

    def time?
      type == "timestamp"
    end
  end
end
