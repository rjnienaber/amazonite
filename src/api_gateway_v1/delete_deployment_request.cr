module Amazonite::ApiGatewayV1
  # Requests API Gateway to delete a Deployment resource.
  class DeleteDeploymentRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The identifier of the Deployment resource to delete.
    @[JSON::Field(key: "deploymentId", ignore: true)]
    property deployment_id : String = ""

    def initialize(
      @rest_api_id : String,
      @deployment_id : String,
    )
    end

    def_equals_and_hash(@rest_api_id, @deployment_id)
  end
end
