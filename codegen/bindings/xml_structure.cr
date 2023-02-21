module Amazonite::Codegen::Bindings
  @[Crinja::Attributes]
  class XmlStructure < Base
    private enum ValueSource
      XmlElement
      KeyXmlElement
      ValueXmlElement
    end

    @name : String
    @has_parameters : Bool
    @has_assigned : Bool
    @needs_values : Bool
    @parameters : Array(Crinja::Value)
    @assigned_parameters : Array(Crinja::Value)
    @list_parameters : Array(Crinja::Value)
    @map_parameters : Array(Crinja::Value)

    getter name, has_parameters, needs_values, parameters, needs_core_alias, needs_module_alias, assigned_parameters, list_parameters, map_parameters, has_assigned

    def initialize(shape : Codegen::Service::Structure, module_alias : String)
      @name = shape.name
      @needs_core_alias = false
      @needs_module_alias = false
      max_length = shape.members.size.zero? ? 0 : shape.members.map { |m| get_name(m).size }.max
      parameters = shape.members.map do |m|
        name = get_name(m)
        underlying_type, _ = m.underlying_crystal_type
        map_key, map_value = m.map_type? ? m.map_types : {nil, nil}
        is_assigned = must_be_assigned?(m)

        Crinja.value({
          is_list:             m.list_type?,
          is_map:              m.map_type?,
          is_optional:         !m.required?,
          is_assigned:         is_assigned,
          name:                name,
          name_spacing:        " " * (max_length - name.size),
          snake_case_name:     m.snake_case_name,
          type:                m.crystal_type,
          key_type:            map_key.nil? ? nil : map_key.crystal_type,
          value_type:          map_value.nil? ? nil : map_value.crystal_type,
          underlying_type:     underlying_type,
          value_converter:     value_converter(m, is_assigned),
          key_xml_converter:   convert_from_xml_string(map_key, is_assigned, ValueSource::KeyXmlElement),
          value_xml_converter: convert_from_xml_string(map_value, is_assigned, ValueSource::ValueXmlElement),
          xml_converter:       convert_from_xml_string(m, is_assigned, ValueSource::XmlElement),
        })
      end

      optional, required = parameters.partition { |m| m["is_optional"].raw }
      @parameters = required + optional

      @assigned_parameters = @parameters.select { |m| m["is_assigned"].raw }
      @list_parameters = @parameters.select { |m| m["is_list"].raw }
      @map_parameters = @parameters.select { |m| m["is_map"].raw }
      @has_parameters = shape.members.size > 0
      @has_assigned = @assigned_parameters.size > 0
      @needs_values = (@assigned_parameters.size - list_parameters.size - map_parameters.size) > 0
    end

    private def must_be_assigned?(member)
      (member.optional? && member.collection_type?) || (member.required? && !member.collection_type?)
    end

    private def get_name(member)
      name = if member.list_type? || member.map_type?
               _, resolved_shapes = member.underlying_crystal_type
               resolved_shapes.last.name
             else
               member.name
             end
      member.location_name || name
    end

    private def hash_source?(value_source)
      [ValueSource::KeyXmlElement, ValueSource::ValueXmlElement].includes?(value_source)
    end

    private def simple_type?(member)
      member.primitive_type? || member.enum_type? || member.underlying_crystal_type[0] == "String"
    end

    private def value_converter(member, is_assigned)
      return nil unless is_assigned
      return "#{member.snake_case_name} unless #{member.snake_case_name}.empty?" if member.collection_type?

      source = "values[:#{member.snake_case_name}]"
      converter = get_primitive_converter(member)
      converter.nil? ? source : "#{converter}(#{source})"
    end

    private def convert_from_xml_string(member, is_assigned, value_source) : String | Nil
      return nil if member.nil?

      source = get_source(member, value_source)
      converter = get_converter(member, value_source, is_assigned)
      operator = member.list_type? ? "<<" : "="
      destination = get_destination(member, value_source)

      if converter.nil?
        "#{destination} #{operator} #{source}"
      else
        "#{destination} #{operator} #{converter}(#{source})"
      end
    end

    private def get_source(member, value_source)
      pos = value_source == ValueSource::ValueXmlElement ? 1 : 0
      xml_position = "n.children[#{pos}]"

      if hash_source?(value_source)
        if simple_type?(member)
          "#{xml_position}.children[0].to_s"
        else
          xml_position
        end
      elsif simple_type?(member)
        "#{xml_position}.to_s"
      else
        "n"
      end
    end

    private def get_converter(member, value_source, is_assigned)
      if simple_type?(member)
        return is_assigned && !hash_source?(value_source) ? nil : get_primitive_converter(member)
      end

      underlying_crystal_type, _ = member.underlying_crystal_type
      "#{underlying_crystal_type}.new"
    end

    private def get_primitive_converter(member)
      underlying_crystal_type, _ = member.underlying_crystal_type
      return "#{underlying_crystal_type}.from_string" if member.enum_type?

      case underlying_crystal_type
      when "Bool"
        @needs_core_alias = true
        "Core::StringUtils.to_bool"
      when "Time"
        @needs_core_alias = true
        "Core::StringUtils.to_time"
      when "Int32", "Int64", "Float64" then "#{underlying_crystal_type}.new"
      when "String" then nil
      else
        raise Exception.new("unable convert to crystal type '#{underlying_crystal_type}' from '#{member.name}'")
      end
    end

    private def get_destination(member, value_source)
      if hash_source?(value_source)
        value_source == ValueSource::KeyXmlElement ? "key" : "value"
      elsif member.list_type?
        amp = member.required? ? "@" : ""
        _, resolved_shapes = member.underlying_crystal_type
        last_shape = resolved_shapes.last
        source = "#{last_shape.name}.new(n)" unless last_shape.primitive?
        "#{amp}#{member.snake_case_name}"
      elsif member.required?
        "values[:#{member.snake_case_name}]"
      else
        "@#{member.snake_case_name}"
      end
    end
  end
end
