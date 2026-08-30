module Amazonite::Codegen::Service
  class Shape
    private KNOWN_KEYS = ["type", "members", "documentation", "enum", "required", "member",
                          "key", "value", "max", "min", "pattern", "box", "sensitive",
                          "deprecated", "deprecatedMessage", "exception", "fault", "union", "document",
                          "timestampFormat", "event", "eventstream", "flattened", "payload"]

    @min : JSON::Any?
    @max : JSON::Any?
    @pattern : String?

    getter name, type, documentation, min, max, pattern

    def initialize(name : String, json : JSON::Any)
      Utils.verify_keys(KNOWN_KEYS, json)
      @name = name[0].upcase + name[1..]
      @type = json["type"].as_s
      @documentation = json["documentation"]? ? json["documentation"].as_s : nil
      # `min`/`max` come from Smithy's smithy.api#length (string/blob/list/map
      # size) or smithy.api#range (numeric value) traits, kept as raw
      # JSON::Any (rather than a fixed Int64/Float64) since a range
      # constraint on a float/double shape carries a decimal bound - the
      # codegen layer that turns these into a Crystal literal just calls
      # `.raw.to_s` on whichever numeric type is actually present.
      @min = json["min"]?
      @max = json["max"]?
      @pattern = json["pattern"]?.try(&.as_s)
    end

    def snake_case_name
      Utils.snake_case_name(name)
    end
  end
end
