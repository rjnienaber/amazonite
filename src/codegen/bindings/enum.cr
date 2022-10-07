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
      @aws_mappings = shape.aws_mappings
      @crystal_mappings = shape.crystal_mappings
    end
  end
end
