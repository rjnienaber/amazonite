module Amazonite::Codegen::Service
  class Member
    private KNOWN_KEYS = ["shape", "documentation", "idempotencyToken", "box", "deprecated", "deprecatedMessage",
                          "location", "locationName", "jsonvalue", # TODO: should return JSON::Any for this?
                          "flattened",
    ]

    @is_list_type : Bool | Nil
    @is_enum_type : Bool | Nil
    @is_time_type : Bool | Nil
    @shape_name : String
    @shape : Shape | Nil

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

    def primitive_type?
      shape.primitive?
    end

    def list_type?
      shape.list?
    end

    def enum_type?
      shape.enum?
    end

    def time_type?
      shape.time?
    end

    def crystal_type(required = @required)
      @resolver.crystal_type(shape, required)
    end

    def underlying_crystal_type
      @resolver.underlying_crystal_type(@shape_name)
    end

    private def shape : Shape
      return @shape.as(Shape) if @shape
      @shape = @resolver.find(@shape_name)
      raise Exception.new("shape '#{@shape_name}' not found") unless @shape
      @shape.as(Shape)
    end
  end
end
