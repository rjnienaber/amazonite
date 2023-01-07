module Amazonite::Codegen::Service
  class ShapeResolver
    KNOWN_PRIMITIVE_TYPES = ["string", "boolean", "timestamp", "long", "integer", "blob", "double", "float"]

    private KNOWN_DATA_STRUCTS    = ["structure", "list", "map"]
    private KNOWN_AWS_TYPES = KNOWN_DATA_STRUCTS + KNOWN_PRIMITIVE_TYPES

    def self.load_json(json : JSON::Any)
      resolver = ShapeResolver.new
      shape_types = Set(String).new
      json.as_h.each do |name, obj|
        shape = if Service::Enum.enum?(obj)
                  Service::Enum.new(name, obj)
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
        shape_types.add(shape.type)
      end

      unknown_types = (shape_types - KNOWN_AWS_TYPES).join("\", \"")
      raise Exception.new("unknown types: \"#{unknown_types}\"") unless unknown_types.empty?

      resolver
    end

    @shape_map : Hash(String, Shape)

    getter shape_map

    def initialize
      @shape_map = {} of String => Shape
    end

    def add(shape)
      @shape_map[shape.name] = shape
    end

    def shapes
      @shape_map.values
    end

    def find(shape_name)
      @shape_map[shape_name]
    end

    def underlying_crystal_type(shape_name)
      shape = @shape_map[shape_name]
      type = resolve_primitive_types(shape)
      if type.nil?
        type = resolve_composite_types(shape, false)
      end
      type
    end

    def crystal_type(shape : Shape, required)
      type = resolve_primitive_types(shape)
      if type.nil?
        type = resolve_composite_types(shape)
      end

      required ? type : type + " | Nil"
    end

    private def crystal_type(shape_name, required)
      crystal_type(@shape_map[shape_name], required)
    end

    private def resolve_primitive_types(shape)
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

    private def resolve_composite_types(shape, add_container = true)
      case shape.type
      when "string"    then shape.is_a?(Service::Enum) ? shape.name : "String"
      when "structure" then shape.name
      when "list"      then resolve_list(shape, add_container)
      when "map"       then resolve_map(shape)
      else
        raise Exception.new("Shape '#{shape.name}' has unknown AWS type: #{shape.type}")
      end
    end

    private def resolve_list(shape, add_container)
      list_type = crystal_type(shape.as(List).member.shape_name, true)
      add_container ? "Array(#{list_type})" : list_type
    end

    private def resolve_map(shape)
      map_shape = shape.as(Map)
      key_type = crystal_type(map_shape.key.shape_name, true)
      value_type = crystal_type(map_shape.value.shape_name, true)
      "Hash(#{key_type}, #{value_type})"
    end
  end
end
