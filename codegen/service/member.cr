module Amazonite::Codegen::Service
  class Member
    private KNOWN_KEYS = ["shape", "documentation", "idempotencyToken", "box", "deprecated", "deprecatedMessage",
                          "location", "locationName", "jsonvalue", # TODO: should return JSON::Any for this?
                          "flattened"
    ]

    @is_enum_type : Bool | Nil
    @is_time_type : Bool | Nil
    @shape_name : String

    getter name, shape_name

    def initialize(@name : String, @required : Bool, json : JSON::Any, @resolver : ShapeResolver)
      Utils.verify_keys(KNOWN_KEYS, json)
      name = json["shape"].as_s
      @shape_name = name[0].upcase + name[1..]
    end

    def required?
      @required
    end

    def snake_case_name
      Utils.snake_case_name(self.name)
    end

    def enum_type?
      @is_enum_type ||= @resolver.enum?(self.shape_name)
    end

    def enum_type
      @enum_type ||= resolver.enum(self.shape_name)
    end

    def time_type?
      @is_time_type ||= @resolver.time?(self.shape_name)
    end

    def crystal_type(required = @required)
      @resolver.crystal_type(@shape_name, required)
    end
  end
end
