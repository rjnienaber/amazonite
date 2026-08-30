private alias Core = Amazonite::Core

module Amazonite::ApiGatewayV1
  # A snapshot of the documentation of an API.
  class DocumentationVersion
    include JSON::Serializable

    # The version identifier of the API documentation snapshot.
    @[JSON::Field(key: "version")]
    property version : String | Nil

    # The date when the API documentation snapshot is created.
    @[JSON::Field(key: "createdDate", converter: Core::AWSEpochConverter)]
    property created_date : Time | Nil

    # The description of the API documentation snapshot.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    def initialize(
      @version : String | Nil = nil,
      @created_date : Time | Nil = nil,
      @description : String | Nil = nil,
    )
    end
  end
end
