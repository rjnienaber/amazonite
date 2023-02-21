module Amazonite::Codegen::Service
  class Member
    private KNOWN_KEYS = ["shape", "documentation", "idempotencyToken", "box", "deprecated", "deprecatedMessage",
                          "location", "locationName", "jsonvalue", # TODO: should return JSON::Any for this?
                          "flattened",
    ]

    # TODO: remove unused instance variables
    @is_list_type : Bool | Nil
    @is_enum_type : Bool | Nil
    @is_time_type : Bool | Nil
    @shape_name : String
    @location_name : String | Nil
    @shape : Shape | Nil

    getter name, shape_name, location_name

    def initialize(@name : String, @required : Bool, json : JSON::Any, @resolver : ShapeResolver)
      Utils.verify_keys(KNOWN_KEYS, json)
      name = json["shape"].as_s
      @shape_name = name[0].upcase + name[1..]
      @location_name = json["locationName"]? ? json["locationName"].as_s : nil
    end

    def required?
      @required
    end

    def optional?
      !required?
    end

    def snake_case_name
      Utils.snake_case_name(self.name)
    end

    def primitive_type?
      shape.primitive?
    end

    def list_type?
      shape.list?
    end

    def map_type?
      shape.map?
    end

    def collection_type?
      list_type? || map_type?
    end

    def map_types
      map = shape.as(Service::Map)
      {map.key, map.value}
    end

    def enum_type?
      shape.enum?
    end

    def time_type?
      shape.time?
    end

    def crystal_type(required = @required)
      @resolver.crystal_type(shape, required, [] of Shape)
    end

    def underlying_crystal_type : Tuple(String, Array(Shape))
      resolved_shapes = [] of Shape
      value = @resolver.underlying_crystal_type(shape, resolved_shapes)
      {value, resolved_shapes}
    end

    private def shape : Shape
      return @shape.as(Shape) if @shape
      @shape = @resolver.find(@shape_name)
      raise Exception.new("shape '#{@shape_name}' not found") unless @shape
      @shape.as(Shape)
    end
  end
end
