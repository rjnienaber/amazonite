module Amazonite::Codegen::Bindings
  @[Crinja::Attributes]
  class Structure < Base
    @name : String
    @members : Array(Crinja::Value)
    @has_parameters : Bool

    getter name, members, has_parameters, parameters, needs_core_alias, needs_module_alias

    def initialize(shape : Amazonite::Codegen::Service::Structure, module_alias : String)
      @name = shape.name
      @needs_core_alias = false
      @needs_module_alias = false
      @members = shape.members.map do |m|
        converter = if m.time_type?
                      @needs_core_alias = true
                      "AC::AWSEpochConverter"
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
        })
      end

      @has_parameters = shape.members.size > 0
      @parameters = [] of Crinja::Value
      shape.members.each do |m|
        next unless m.required?

        parameters << Crinja.value({
          name:        m.snake_case_name,
          type:        m.crystal_type,
          is_optional: false,
        })
      end

      shape.members.each do |m|
        next if m.required?

        parameters << Crinja.value({
          name:        m.snake_case_name,
          type:        m.crystal_type,
          is_optional: true,
        })
      end
    end
  end
end
