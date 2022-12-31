module Amazonite::Codegen::Service
  class ShapeResolver
    private KNOWN_DATA_STRUCTS    = ["structure", "list", "map"]
    private KNOWN_PRIMITIVE_TYPES = ["string", "boolean", "timestamp", "long", "integer", "blob",
                                     "double", "float"]
    private KNOWN_AWS_TYPES = KNOWN_DATA_STRUCTS + KNOWN_PRIMITIVE_TYPES

    def self.load_json(json : JSON::Any)
      resolver = ShapeResolver.new
      json.as_h.each do |name, obj|
        shape = if Enum.enum?(obj)
                  Enum.new(name, obj)
                elsif List.list?(obj)
                  List.new(name, obj, resolver)
                elsif Map.map?(obj)
                  Map.new(name, obj, resolver)
                elsif Structure.structure?(obj)
                  Structure.new(name, obj, resolver)
                else
                  Shape.new(name, obj)
                end
        resolver.add(shape)
      end

      primitive_types = resolver.shapes.map(&.type).to_set
      unknown_types = (primitive_types - KNOWN_AWS_TYPES).join("\", \"")
      raise Exception.new("unknown types: \"#{unknown_types}\"") unless unknown_types.empty?

      resolver
    end

    @shape_map : Hash(String, Shape)
    @shapes : Array(Shape)

    getter shape_map, shapes

    def initialize
      @shape_map = {} of String => Shape
      @shapes = [] of Shape
    end

    def add(shape)
      @shape_map[shape.name] = shape
      @shapes << shape
    end

    def find(shape_name)
      @shape_map[shape_name]
    end

    def enum?(shape_name)
      @shape_map[shape_name].is_a?(Enum)
    end

    def time?(shape_name)
      @shape_map[shape_name].type == "timestamp"
    end

    def enum(shape_name)
      raise Exception.new("Shape '#{shape_name}' is not an enum") unless enum?(shape_name)
      @shape_map[shape_name].as(Enum)
    end

    def crystal_type(shape_name, required)
      crystal_type(@shape_map[shape_name], required)
    end

    def crystal_type(shape : Shape, required)
      type = map_primitive_types(shape)
      if type.nil?
        type = map_composite_types(shape)
      end

      required ? type : type + " | Nil"
    end

    private def map_primitive_types(shape)
      case shape.type
      when "timestamp" then "Time"
      when "boolean"   then "Bool"
      when "blob"      then "String"
      when "integer"   then "Int32"
      when "long"      then "Int64"
      when "float"     then "Float32"
      when "double"    then "Float64"
      end
    end

    private def map_composite_types(shape)
      case shape.type
      when "string"    then shape.is_a?(Enum) ? shape.name : "String"
      when "structure" then shape.name
      when "list"      then resolve_list(shape)
      when "map"       then resolve_map(shape)
      else
        raise Exception.new("Shape '#{shape.name}' has unknown AWS type: #{shape.type}")
      end
    end

    private def resolve_list(shape)
      list_type = crystal_type(shape.as(List).member.shape_name, true)
      "Array(#{list_type})"
    end

    private def resolve_map(shape)
      map_shape = shape.as(Map)
      key_type = crystal_type(map_shape.key.shape_name, true)
      value_type = crystal_type(map_shape.value.shape_name, true)
      "Hash(#{key_type}, #{value_type})"
    end
  end
end
