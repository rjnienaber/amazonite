private alias AAG = Amazonite::ApiGatewayV1

module Amazonite::ApiGatewayV1
  # Requests API Gateway to create a Deployment resource.
  class CreateDeploymentRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The name of the Stage resource for the Deployment resource to create.
    @[JSON::Field(key: "stageName")]
    property stage_name : String | Nil

    # The description of the Stage resource for the Deployment resource to create.
    @[JSON::Field(key: "stageDescription")]
    property stage_description : String | Nil

    # The description for the Deployment resource to create.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    # Enables a cache cluster for the Stage resource specified in the input.
    @[JSON::Field(key: "cacheClusterEnabled")]
    property cache_cluster_enabled : Bool | Nil

    # The stage's cache capacity in GB. For more information about choosing a cache size, see
    # [Enabling API caching to enhance
    # responsiveness](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-caching.html).
    @[JSON::Field(key: "cacheClusterSize", converter: AAG::CacheClusterSize)]
    property cache_cluster_size : CacheClusterSize | Nil

    # A map that defines the stage variables for the Stage resource that is associated with the new
    # deployment. Variable names can have alphanumeric and underscore characters, and the values must
    # match `[A-Za-z0-9-._~:/?#&=,]+`.
    @[JSON::Field(key: "variables")]
    property variables : Hash(String, String) | Nil

    # The input configuration for the canary deployment when the deployment is a canary release
    # deployment.
    @[JSON::Field(key: "canarySettings")]
    property canary_settings : DeploymentCanarySettings | Nil

    # Specifies whether active tracing with X-ray is enabled for the Stage.
    @[JSON::Field(key: "tracingEnabled")]
    property tracing_enabled : Bool | Nil

    def initialize(
      @rest_api_id : String,
      @stage_name : String | Nil = nil,
      @stage_description : String | Nil = nil,
      @description : String | Nil = nil,
      @cache_cluster_enabled : Bool | Nil = nil,
      @cache_cluster_size : CacheClusterSize | Nil = nil,
      @variables : Hash(String, String) | Nil = nil,
      @canary_settings : DeploymentCanarySettings | Nil = nil,
      @tracing_enabled : Bool | Nil = nil,
    )
    end

    def_equals_and_hash(@rest_api_id, @stage_name, @stage_description, @description, @cache_cluster_enabled, @cache_cluster_size, @variables, @canary_settings, @tracing_enabled)
  end
end
