module Amazonite::Codegen::Bindings
  @[Crinja::Attributes]
  class Enum < Base
    @name : String
    @values : Array(String)
    @aws_mappings : Array(Tuple(String, String))?
    @crystal_mappings : Array(Tuple(String, String))
    @doc : String?

    getter name, values, has_aws_mappings, aws_mappings, crystal_mappings, doc, has_doc

    def initialize(shape : Amazonite::Codegen::Service::Enum)
      @name = shape.name
      @values = shape.values
      @has_aws_mappings = shape.aws_mappings?
      @aws_mappings = shape.aws_mappings if @has_aws_mappings
      @crystal_mappings = shape.crystal_mappings
      @doc = Amazonite::Codegen::Service::Utils.doc_comment(shape.documentation)
      @has_doc = !!@doc
    end
  end
end
