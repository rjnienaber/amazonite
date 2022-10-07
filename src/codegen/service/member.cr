module Amazonite::Codegen::Service
  class Member
    private KNOWN_KEYS = ["shape", "documentation", "idempotencyToken"]

    @is_enum_type : Bool | Nil
    @is_time_type : Bool | Nil

    getter name, shape_name

    def initialize(@name : String, @required : Bool, json : JSON::Any, @resolver : ShapeResolver)
      Utils.verify_keys(KNOWN_KEYS, json)
      @shape_name = json["shape"].as_s
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
