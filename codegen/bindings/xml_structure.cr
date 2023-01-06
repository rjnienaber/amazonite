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

    def initialize(shape : Amazonite::Codegen::Service::Structure, module_alias : String)
      @name = shape.name
      @needs_core_alias = false
      @needs_module_alias = false
      max_length = shape.members.size.zero? ? 0 : shape.members.map { |m| get_name(m).size }.max
      @parameters = shape.members.map do |m|
        name = get_name(m)

        xml_converter = if m.list?
          amp = m.required? ? "@" : ""
          "#{amp}#{m.snake_case_name} << #{m.underlying_crystal_type}.new(n)"
        elsif m.required?
          "values[:#{m.snake_case_name}] = n.children[0].to_s"
        else
          "@#{m.snake_case_name} = n.children[0].to_s"
        end

        value_converter = if m.list? && !m.required?
                            "#{m.snake_case_name} unless #{m.snake_case_name}.size.zero?"
                          elsif m.required?
                            case m.crystal_type
                            when "Bool"
                              @needs_core_alias = true
                              "Core::StringUtils.to_bool(values[:#{m.snake_case_name}])"
                            else "values[:#{m.snake_case_name}]"
                            end
                          end

        Crinja.value({
          is_list:         m.list?,
          is_optional:     !m.required?,
          name:            name,
          name_spacing:    " " * (max_length - name.size),
          snake_case_name: m.snake_case_name,
          type:            m.crystal_type,
          underlying_type: m.underlying_crystal_type,
          value_converter: value_converter,
          xml_converter:   xml_converter
        })
      end


      @assigned_parameters = @parameters.select { |m| (m["is_list"].raw && m["is_optional"].raw) || (!m["is_list"].raw && !m["is_optional"].raw) }
      @list_parameters = @parameters.select { |m| m["is_list"].raw }
      @has_parameters = shape.members.size > 0
      @has_assigned = @assigned_parameters.size > 0
      @needs_values = (@assigned_parameters.size - list_parameters.size) > 0
    end

    private def get_name(member)
      name = member.list? ? member.underlying_crystal_type : member.name
    end
  end
end
