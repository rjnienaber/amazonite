private alias AAG = Amazonite::ApiGatewayV1

module Amazonite::ApiGatewayV1
  # Requests API Gateway to create a Stage resource.
  class CreateStageRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The name for the Stage resource. Stage names can only contain alphanumeric characters, hyphens,
    # and underscores. Maximum length is 128 characters.
    @[JSON::Field(key: "stageName")]
    property stage_name : String

    # The identifier of the Deployment resource for the Stage resource.
    @[JSON::Field(key: "deploymentId")]
    property deployment_id : String

    # The description of the Stage resource.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    # Whether cache clustering is enabled for the stage.
    @[JSON::Field(key: "cacheClusterEnabled")]
    property cache_cluster_enabled : Bool | Nil

    # The stage's cache capacity in GB. For more information about choosing a cache size, see
    # [Enabling API caching to enhance
    # responsiveness](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-caching.html).
    @[JSON::Field(key: "cacheClusterSize", converter: AAG::CacheClusterSize)]
    property cache_cluster_size : CacheClusterSize | Nil

    # A map that defines the stage variables for the new Stage resource. Variable names can have
    # alphanumeric and underscore characters, and the values must match `[A-Za-z0-9-._~:/?#&=,]+`.
    @[JSON::Field(key: "variables")]
    property variables : Hash(String, String) | Nil

    # The version of the associated API documentation.
    @[JSON::Field(key: "documentationVersion")]
    property documentation_version : String | Nil

    # The canary deployment settings of this stage.
    @[JSON::Field(key: "canarySettings")]
    property canary_settings : CanarySettings | Nil

    # Specifies whether active tracing with X-ray is enabled for the Stage.
    @[JSON::Field(key: "tracingEnabled")]
    property tracing_enabled : Bool | Nil

    # The key-value map of strings. The valid character set is [a-zA-Z+-=._:/]. The tag key can be up
    # to 128 characters and must not start with `aws:`. The tag value can be up to 256 characters.
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @rest_api_id : String,
      @stage_name : String,
      @deployment_id : String,
      @description : String | Nil = nil,
      @cache_cluster_enabled : Bool | Nil = nil,
      @cache_cluster_size : CacheClusterSize | Nil = nil,
      @variables : Hash(String, String) | Nil = nil,
      @documentation_version : String | Nil = nil,
      @canary_settings : CanarySettings | Nil = nil,
      @tracing_enabled : Bool | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
    )
    end
  end
end
