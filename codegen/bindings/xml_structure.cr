module Amazonite::Codegen::Bindings
  @[Crinja::Attributes]
  class XmlStructure < Base
    @name : String
    @has_parameters : Bool
    @has_required : Bool
    @needs_values : Bool
    @parameters : Array(Crinja::Value)
    @required_parameters : Array(Crinja::Value)
    @required_list_parameters : Array(Crinja::Value)

    getter name, has_parameters, needs_values, parameters, needs_core_alias, needs_module_alias, required_parameters, required_list_parameters, has_required

    def initialize(shape : Amazonite::Codegen::Service::Structure, module_alias : String)
      @name = shape.name
      @needs_core_alias = false
      @needs_module_alias = false
      max_length = shape.members.size.zero? ? 0 : shape.members.map { |m| get_name(m).size }.max
      crinja_members = shape.members.map do |m|
        name = m.list? ? m.underlying_crystal_type : m.name

        xml_converter = if m.required?
          if m.list?
            @needs_module_alias = true
            "@#{m.snake_case_name} << #{module_alias}::#{m.underlying_crystal_type}.new(n)"
          else
            "values[:#{m.snake_case_name}] = n.children[0].to_s"
          end
        else
          "@#{m.snake_case_name} = n.children[0].to_s"
        end

        value_converter = if m.required?
                            case m.crystal_type
                            when "Bool"
                              @needs_core_alias = true
                              "Core::StringUtils.to_bool(values[:#{m.snake_case_name}])"
                            else "values[:#{m.snake_case_name}]"
                            end
                          else
                            nil
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

      optional, @required_parameters = crinja_members.partition { |m| m["is_optional"].raw }
      @parameters = @required_parameters + optional
      @required_list_parameters, @required_parameters = @required_parameters.partition { |m| m["is_list"].raw }
      @has_parameters = shape.members.size > 0
      @has_required = @required_parameters.size > 0
      @needs_values = (@required_parameters.size - @required_list_parameters.size) > 0
    end

    private def get_name(member)
      name = member.list? ? member.underlying_crystal_type : member.name
    end
  end
end
