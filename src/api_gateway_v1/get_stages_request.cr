module Amazonite::ApiGatewayV1
  # Requests API Gateway to get information about one or more Stage resources.
  class GetStagesRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The stages' deployment identifiers.
    @[JSON::Field(key: "deploymentId", ignore: true)]
    property deployment_id : String | Nil

    def initialize(
      @rest_api_id : String,
      @deployment_id : String | Nil = nil,
    )
    end

    def_equals_and_hash(@rest_api_id, @deployment_id)
  end
end
