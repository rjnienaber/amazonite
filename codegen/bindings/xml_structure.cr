module Amazonite::Codegen::Bindings
  @[Crinja::Attributes]
  class XmlStructure < Base
    @name : String
    @has_parameters : Bool
    @has_assigned : Bool
    @needs_values : Bool
    @parameters : Array(Crinja::Value)
    @assigned_parameters : Array(Crinja::Value)
    @list_parameters : Array(Crinja::Value)

    getter name, has_parameters, needs_values, parameters, needs_core_alias, needs_module_alias, assigned_parameters, list_parameters, has_assigned

    def initialize(shape : Codegen::Service::Structure, module_alias : String)
      @name = shape.name
      @needs_core_alias = false
      @needs_module_alias = false
      max_length = shape.members.size.zero? ? 0 : shape.members.map { |m| get_name(m).size }.max
      parameters = shape.members.map do |m|
        name = get_name(m)
        underlying_type, _ = m.underlying_crystal_type
        Crinja.value({
          is_list:         m.list_type?,
          is_optional:     !m.required?,
          name:            name,
          name_spacing:    " " * (max_length - name.size),
          snake_case_name: m.snake_case_name,
          type:            m.crystal_type,
          underlying_type: underlying_type,
          value_converter: value_converter(m),
          xml_converter:   xml_converter(m)
        })
      end

      optional, required = parameters.partition { |m| m["is_optional"].raw }
      @parameters = required + optional

      @assigned_parameters = @parameters.select { |m| (m["is_list"].raw && m["is_optional"].raw) || (!m["is_list"].raw && !m["is_optional"].raw) }
      @list_parameters = @parameters.select { |m| m["is_list"].raw }
      @has_parameters = shape.members.size > 0
      @has_assigned = @assigned_parameters.size > 0
      @needs_values = (@assigned_parameters.size - list_parameters.size) > 0
    end

    private def get_name(member)
      if member.list_type?
        _, resolved_shapes = member.underlying_crystal_type
        resolved_shapes.last.name
      else
        member.name
      end
    end

    private def value_converter(member)
      if member.list_type? && !member.required?
        "#{member.snake_case_name} unless #{member.snake_case_name}.size.zero?"
      elsif member.required?
        case member.crystal_type
        when "Bool"
          @needs_core_alias = true
          "Core::StringUtils.to_bool(values[:#{member.snake_case_name}])"
        else "values[:#{member.snake_case_name}]"
        end
      end
    end

    private def xml_converter(member)
      if member.list_type?
        amp = member.required? ? "@" : ""
        _, resolved_shapes = member.underlying_crystal_type
        last_shape = resolved_shapes.last
        if last_shape.primitive?
          "#{amp}#{member.snake_case_name} << n.children[0].to_s"
        else
          "#{amp}#{member.snake_case_name} << #{last_shape.name}.new(n)"
        end
      elsif member.required?
        "values[:#{member.snake_case_name}] = n.children[0].to_s"
      else
        "@#{member.snake_case_name} = n.children[0].to_s"
      end
    end
  end
end
