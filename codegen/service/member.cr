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
    @location : String?
    @location_name : String?
    @documentation : String?

    getter name, shape_name, location, location_name, documentation

    def initialize(@name : String, @required : Bool, json : JSON::Any, @resolver : ShapeResolver)
      Utils.verify_keys(KNOWN_KEYS, json)
      name = json["shape"].as_s
      @shape_name = name[0].upcase + name[1..]
      @location = json["location"]?.try(&.as_s)
      @location_name = json["locationName"]?.try(&.as_s)
      @documentation = json["documentation"]?.try(&.as_s)
    end

    # For a "uri"/"querystring"/"header" member, the wire name to use - the
    # explicit locationName if the Smithy trait carried one, otherwise the
    # member's own AWS name (true for httpLabel members, whose {placeholder}
    # in the URI template always matches the member name exactly).
    def wire_name
      @location_name || @name
    end

    def label?
      @location == "uri"
    end

    def query?
      @location == "querystring"
    end

    def header?
      @location == "header"
    end

    def status_code?
      @location == "statusCode"
    end

    def body?
      @location.nil?
    end

    def structure_type?
      @resolver.find(shape_name).is_a?(Structure)
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

    # The list's own item member (a fresh, unnamed Member wrapping the list's
    # element shape) - lets callers reuse the same type-check/expression
    # helpers written against a plain Member for list elements too.
    def list_item_member : Member
      @resolver.find(shape_name).as(List).member
    end

    def map_type?
      @resolver.find(shape_name).is_a?(Map)
    end

    def map_key_member : Member
      @resolver.find(shape_name).as(Map).key
    end

    def map_value_member : Member
      @resolver.find(shape_name).as(Map).value
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
