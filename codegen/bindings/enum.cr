module Amazonite::Codegen::Bindings
  @[Crinja::Attributes]
  class Enum < Base
    @name : String
    @values : Array(String)
    @aws_mappings : Array(Tuple(String, String, String)) | Nil
    @crystal_mappings : Array(Tuple(String, String, String))

    getter name, values, has_aws_mappings, aws_mappings, crystal_mappings

    def initialize(shape : Amazonite::Codegen::Service::Enum)
      @name = shape.name
      @values = shape.values
      @has_aws_mappings = shape.aws_mappings?

      if @has_aws_mappings
        @aws_mappings = add_spacing(shape.aws_mappings.as(Array(Tuple(String, String))))
      end

      @crystal_mappings = add_spacing(shape.crystal_mappings)
    end

    private def add_spacing(mappings : Array(Tuple(String, String))) : Array(Tuple(String, String, String))
      max_length = mappings.max_by(&.[0].size)[0].size
      mappings.map { |v| {v[0], " " * (max_length - v[0].size), v[1]} }
    end
  end
end
