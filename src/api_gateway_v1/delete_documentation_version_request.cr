module Amazonite::ApiGatewayV1
  # Deletes an existing documentation version of an API.
  class DeleteDocumentationVersionRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The version identifier of a to-be-deleted documentation snapshot.
    @[JSON::Field(key: "documentationVersion", ignore: true)]
    property documentation_version : String = ""

    def initialize(
      @rest_api_id : String,
      @documentation_version : String,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@rest_api_id, @documentation_version)
  end
end
