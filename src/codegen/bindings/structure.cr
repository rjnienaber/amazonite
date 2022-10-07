module Amazonite::Codegen::Bindings
  @[Crinja::Attributes]
  class Structure < Base
    @name : String
    @members : Array(Crinja::Value)

    getter name, members, parameters

    def initialize(shape : Amazonite::Codegen::Service::Structure)
      @name = shape.name
      @members = shape.members.map do |m|
        converter = if m.time_type?
          "Amazonite::Core::AWSEpochConverter"
        elsif m.enum_type?
          "Amazonite::DynamoDB::#{m.crystal_type(true)}"
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
