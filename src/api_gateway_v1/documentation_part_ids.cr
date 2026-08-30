module Amazonite::ApiGatewayV1
  # A collection of the imported DocumentationPart identifiers.
  class DocumentationPartIds
    include JSON::Serializable

    # A list of the returned documentation part identifiers.
    @[JSON::Field(key: "ids")]
    property ids : Array(String) | Nil

    # A list of warning messages reported during import of documentation parts.
    @[JSON::Field(key: "warnings")]
    property warnings : Array(String) | Nil

    def initialize(
      @ids : Array(String) | Nil = nil,
      @warnings : Array(String) | Nil = nil,
    )
    end
  end
end
