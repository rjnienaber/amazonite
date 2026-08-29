module Amazonite::ApiGatewayV1
  # Requests API Gateway to get information about a Deployment resource.
  class GetDeploymentRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The identifier of the Deployment resource to get information about.
    @[JSON::Field(key: "deploymentId", ignore: true)]
    property deployment_id : String = ""

    # A query parameter to retrieve the specified embedded resources of the returned Deployment
    # resource in the response. In a REST API call, this `embed` parameter value is a list of
    # comma-separated strings, as in `GET
    # /restapis/{restapi_id}/deployments/{deployment_id}?embed=var1,var2`. The SDK and other
    # platform-dependent libraries might use a different format for the list. Currently, this request
    # supports only retrieval of the embedded API summary this way. Hence, the parameter value must be
    # a single-valued list containing only the `"apisummary"` string. For example, `GET
    # /restapis/{restapi_id}/deployments/{deployment_id}?embed=apisummary`.
    @[JSON::Field(key: "embed", ignore: true)]
    property embed : Array(String) | Nil

    def initialize(
      @rest_api_id : String,
      @deployment_id : String,
      @embed : Array(String) | Nil = nil,
    )
    end
  end
end
