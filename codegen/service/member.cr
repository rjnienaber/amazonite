module Amazonite::Codegen::Service
  class Member
    private KNOWN_KEYS = ["shape", "documentation", "idempotencyToken", "box", "deprecated", "deprecatedMessage",
                          "location", "locationName", "jsonName", "jsonvalue", # TODO: should return JSON::Any for this?
                          "contextParam", "flattened",
    ]

    @is_enum_type : Bool?
    @enum_type : Enum?
    @is_time_type : Bool?
    @is_blob_type : Bool?
    @shape_name : String
    @location : String?
    @location_name : String?
    @documentation : String?
    @json_name : String?

    getter name, shape_name, location, location_name, documentation

    def initialize(@name : String, @required : Bool, json : JSON::Any, @resolver : ShapeResolver)
      Utils.verify_keys(KNOWN_KEYS, json)
      name = json["shape"].as_s
      @shape_name = name[0].upcase + name[1..]
      @location = json["location"]?.try(&.as_s)
      @location_name = json["locationName"]?.try(&.as_s)
      @documentation = json["documentation"]?.try(&.as_s)
      @json_name = json["jsonName"]?.try(&.as_s)
    end

    # For a "uri"/"querystring"/"header" member, the wire name to use - the
    # explicit locationName if the Smithy trait carried one, otherwise the
    # member's own AWS name (true for httpLabel members, whose {placeholder}
    # in the URI template always matches the member name exactly).
    def wire_name
      @location_name || @name
    end

    # The JSON body key to use for a plain (non-http-routed) member - unlike
    # wire_name, this is never influenced by httpLabel/httpQuery/httpHeader
    # (rest-json-only routing traits that some JSON-protocol services carry
    # vestigially on an ordinary body member), only by an explicit jsonName
    # override or the member's own name.
    def json_wire_name
      @json_name || @name
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

    def string_type?
      @resolver.find(shape_name).type == "string" && !enum_type?
    end

    def numeric_type?
      {"integer", "long", "float", "double"}.includes?(@resolver.find(shape_name).type)
    end

    # `min`/`max`/`pattern` belong to the shape this member points at (e.g.
    # a "TableName" string shape's length/pattern), not the member ref
    # itself - Smithy attaches constraint traits to the shape definition,
    # so every member sharing that shape shares the same constraint.
    def min
      @resolver.find(shape_name).min
    end

    def max
      @resolver.find(shape_name).max
    end

    def pattern
      @resolver.find(shape_name).pattern
    end

    # A Crystal numeric literal (as source text) for `min`/`max` - `.raw`
    # is whichever of Int64/Float64 the JSON constraint actually carried,
    # and `.to_s` on either produces text Crystal parses back as the same
    # kind of literal.
    def min_literal : String?
      min.try(&.raw.to_s)
    end

    def max_literal : String?
      max.try(&.raw.to_s)
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

    def enum_type : Enum
      @enum_type ||= @resolver.enum(shape_name)
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
