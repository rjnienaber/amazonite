module Amazonite::Codegen::Service
  class ShapeResolver
    KNOWN_PRIMITIVE_TYPES = ["string", "boolean", "timestamp", "long", "integer", "blob", "double", "float"]

    private KNOWN_DATA_STRUCTS = ["structure", "list", "map"]
    private KNOWN_AWS_TYPES    = KNOWN_DATA_STRUCTS + KNOWN_PRIMITIVE_TYPES

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

    # TODO: combine this method with 'crystal_type'
    def underlying_crystal_type(shape, resolved_shapes : Array(Shape))
      resolved_shapes << shape
      type = resolve_primitive_types(shape, resolved_shapes)
      if type.nil?
        type = resolve_composite_types(shape, resolved_shapes, false)
      end
      type
    end

    def crystal_type(shape : Shape, required, resolved_shapes : Array(Shape))
      resolved_shapes << shape
      type = resolve_primitive_types(shape, resolved_shapes)
      if type.nil?
        type = resolve_composite_types(shape, resolved_shapes)
      end

      required ? type : type + " | Nil"
    end

    private def crystal_type(shape_name, required, resolved_shapes : Array(Shape))
      crystal_type(@shape_map[shape_name], required, resolved_shapes)
    end

    private def resolve_primitive_types(shape, resolved_shapes : Array(Shape))
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

    private def resolve_composite_types(shape, resolved_shapes : Array(Shape), add_container = true)
      case shape.type
      when "string"    then shape.is_a?(Service::Enum) ? shape.name : "String"
      when "structure" then shape.name
      when "list"      then resolve_list(shape, add_container, resolved_shapes)
      when "map"       then resolve_map(shape, resolved_shapes)
      else
        raise Exception.new("Shape '#{shape.name}' has unknown AWS type: #{shape.type}")
      end
    end

    private def resolve_list(shape, add_container, resolved_shapes : Array(Shape))
      list_type = crystal_type(shape.as(List).member.shape_name, true, resolved_shapes)
      add_container ? "Array(#{list_type})" : list_type
    end

    private def resolve_map(shape, resolved_shapes : Array(Shape))
      map_shape = shape.as(Map)
      key_type = crystal_type(map_shape.key.shape_name, true, resolved_shapes)
      value_type = crystal_type(map_shape.value.shape_name, true, resolved_shapes)
      "Hash(#{key_type}, #{value_type})"
    end
  end
end
