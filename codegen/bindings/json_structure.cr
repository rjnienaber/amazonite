module Amazonite::Codegen::Bindings
  @[Crinja::Attributes]
  class JsonStructure < Base
    @name : String
    @parameters : Array(Crinja::Value)
    @has_parameters : Bool

    getter name, has_parameters, parameters, needs_core_alias, needs_module_alias

    def initialize(shape : Amazonite::Codegen::Service::Structure, module_alias : String)
      @name = shape.name
      @needs_core_alias = false
      @needs_module_alias = false
      crinja_members = shape.members.map do |m|
        converter = if m.time_type?
                      @needs_core_alias = true
                      "Core::AWSEpochConverter"
                    elsif m.enum_type?
                      @needs_module_alias = true
                      "#{module_alias}::#{m.crystal_type(true)}"
                    else
                      nil
                    end
        has_converter = !!converter

        Crinja.value({
          name:            m.name,
          snake_case_name: m.snake_case_name,
          type:            m.crystal_type,
          has_converter:   has_converter,
          converter:       converter,
          is_optional:     !m.required?,
        })
      end

      @has_parameters = shape.members.size > 0
      optional, required = crinja_members.partition { |m| m["is_optional"].raw }
      @parameters = required + optional
    end
  end
end
