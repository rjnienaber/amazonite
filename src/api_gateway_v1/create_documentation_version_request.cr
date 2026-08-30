module Amazonite::ApiGatewayV1
  # Creates a new documentation version of a given API.
  class CreateDocumentationVersionRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The version identifier of the new snapshot.
    @[JSON::Field(key: "documentationVersion")]
    property documentation_version : String

    # The stage name to be associated with the new documentation snapshot.
    @[JSON::Field(key: "stageName")]
    property stage_name : String | Nil

    # A description about the new documentation snapshot.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    def initialize(
      @rest_api_id : String,
      @documentation_version : String,
      @stage_name : String | Nil = nil,
      @description : String | Nil = nil,
    )
    end
  end
end
