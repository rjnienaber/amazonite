module Amazonite::ApiGatewayV1
  # Gets a documentation snapshot of an API.
  class GetDocumentationVersionRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The version identifier of the to-be-retrieved documentation snapshot.
    @[JSON::Field(key: "documentationVersion", ignore: true)]
    property documentation_version : String = ""

    def initialize(
      @rest_api_id : String,
      @documentation_version : String,
    )
    end

    def_equals_and_hash(@rest_api_id, @documentation_version)
  end
end
