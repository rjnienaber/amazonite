module Amazonite::Codegen::Service
  class ShapeResolver
    private KNOWN_DATA_STRUCTS    = ["structure", "list", "map"]
    private KNOWN_PRIMITIVE_TYPES = ["string", "boolean", "timestamp", "long", "integer", "blob",
                                     "double"]
    private KNOWN_AWS_TYPES = KNOWN_DATA_STRUCTS + KNOWN_PRIMITIVE_TYPES

    def self.load_json(json : JSON::Any)
      resolver = ShapeResolver.new
      json.as_h.each do |name, json|
        shape = if Enum.enum?(json)
                  Enum.new(name, json)
                elsif List.list?(json)
                  List.new(name, json, resolver)
                elsif Map.map?(json)
                  Map.new(name, json, resolver)
                elsif Structure.structure?(json)
                  Structure.new(name, json, resolver)
                else
                  Shape.new(name, json)
                end
        resolver.add(shape)
      end

      primitive_types = resolver.shapes.map { |s| s.type }.to_set
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
      type = case shape.type
             when "string"
               if shape.is_a?(Enum)
                 shape.name
               else
                 "String"
               end
             when "timestamp" then "Time"
             when "boolean"   then "Bool"
             when "blob"      then "String"
             when "integer"   then "Int32"
             when "long"      then "Int64"
             when "double"    then "Float64"
             when "structure"
               shape.name
             when "list"
               list_shape = self.get_final_shape(shape.as(List).member.shape_name)
               list_type = crystal_type(list_shape, true)
               "Array(#{list_type})"
             when "map"
               map_shape = shape.as(Map)
               key_shape = self.get_final_shape(map_shape.key.shape_name)
               key_type = crystal_type(key_shape, true)
               value_shape = self.get_final_shape(map_shape.value.shape_name)
               value_type = crystal_type(value_shape, true)
               "Hash(#{key_type}, #{value_type})"
             else
               raise Exception.new("Shape '#{shape.name}' has unknown AWS type: #{shape.type}")
             end
      required ? type : type + " | Nil"
    end

    private def get_final_shape(shape_name : String)
      shape = @shape_map[shape_name]
      count = 0
      while (true)
        raise Exception.new("infinite loop detected for shape '#{shape_name}'") if count > 100
        t = @shape_map.fetch(shape.type, nil)
        return shape if t.nil?
        shape = t
        count += 1
      end
    end
  end
end
