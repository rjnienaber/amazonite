module Amazonite::Codegen::Service
  class Shape
    private KNOWN_KEYS = ["type", "members", "documentation", "enum", "required", "member",
                          "key", "value", "max", "min", "pattern", "box"]

    getter name, type, documentation

    def initialize(@name : String, json : JSON::Any)
      Utils.verify_keys(KNOWN_KEYS, json)
      @type = json["type"].as_s
      @documentation = json["documentation"]? ? json["documentation"].as_s : nil
    end

    def snake_case_name
      Utils.snake_case_name(self.name)
    end
  end
end
