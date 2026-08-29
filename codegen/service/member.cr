module Amazonite::Codegen::Service
  class Member
    private KNOWN_KEYS = ["shape", "documentation", "idempotencyToken", "box", "deprecated", "deprecatedMessage",
                          "location", "locationName", "jsonvalue", # TODO: should return JSON::Any for this?
                          "contextParam", "flattened",
    ]

    @is_enum_type : Bool?
    @is_time_type : Bool?
    @is_blob_type : Bool?
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
      Utils.snake_case_name(name)
    end

    def enum_type?
      @is_enum_type ||= @resolver.enum?(shape_name)
    end

    def enum_type
      @enum_type ||= resolver.enum(shape_name)
    end

    def list_of_enum?
      shape = @resolver.find(shape_name)
      shape.is_a?(List) && @resolver.enum?(shape.member.shape_name)
    end

    def list_enum_crystal_type
      @resolver.find(shape_name).as(List).member.shape_name
    end

    def list_type?
      @resolver.find(shape_name).is_a?(List)
    end

    def list_item_crystal_type
      @resolver.find(shape_name).as(List).member.crystal_type(true)
    end

    def time_type?
      @is_time_type ||= @resolver.time?(shape_name)
    end

    def blob_type?
      @is_blob_type ||= @resolver.blob?(shape_name)
    end

    def list_of_blob?
      shape = @resolver.find(shape_name)
      shape.is_a?(List) && @resolver.blob?(shape.member.shape_name)
    end

    def crystal_type(required = @required)
      @resolver.crystal_type(@shape_name, required)
    end
  end
end
