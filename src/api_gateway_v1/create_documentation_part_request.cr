module Amazonite::ApiGatewayV1
  # Creates a new documentation part of a given API.
  class CreateDocumentationPartRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The location of the targeted API entity of the to-be-created documentation part.
    @[JSON::Field(key: "location")]
    property location : DocumentationPartLocation

    # The new documentation content map of the targeted API entity. Enclosed key-value pairs are
    # API-specific, but only OpenAPI-compliant key-value pairs can be exported and, hence, published.
    @[JSON::Field(key: "properties")]
    property properties : String

    def initialize(
      @rest_api_id : String,
      @location : DocumentationPartLocation,
      @properties : String,
    )
    end

    def_equals_and_hash(@rest_api_id, @location, @properties)
  end
end
