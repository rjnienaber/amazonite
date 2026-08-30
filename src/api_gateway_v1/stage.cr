private alias AAG = Amazonite::ApiGatewayV1
private alias Core = Amazonite::Core

module Amazonite::ApiGatewayV1
  # Represents a unique identifier for a version of a deployed RestApi that is callable by users.
  class Stage
    include JSON::Serializable

    # The identifier of the Deployment that the stage points to.
    @[JSON::Field(key: "deploymentId")]
    property deployment_id : String | Nil

    # The identifier of a client certificate for an API stage.
    @[JSON::Field(key: "clientCertificateId")]
    property client_certificate_id : String | Nil

    # The name of the stage is the first path segment in the Uniform Resource Identifier (URI) of a
    # call to API Gateway. Stage names can only contain alphanumeric characters, hyphens, and
    # underscores. Maximum length is 128 characters.
    @[JSON::Field(key: "stageName")]
    property stage_name : String | Nil

    # The stage's description.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    # Specifies whether a cache cluster is enabled for the stage. To activate a method-level cache,
    # set `CachingEnabled` to `true` for a method.
    @[JSON::Field(key: "cacheClusterEnabled")]
    property cache_cluster_enabled : Bool | Nil

    # The stage's cache capacity in GB. For more information about choosing a cache size, see
    # [Enabling API caching to enhance
    # responsiveness](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-caching.html).
    @[JSON::Field(key: "cacheClusterSize", converter: AAG::CacheClusterSize)]
    property cache_cluster_size : CacheClusterSize | Nil

    # The status of the cache cluster for the stage, if enabled.
    @[JSON::Field(key: "cacheClusterStatus", converter: AAG::CacheClusterStatus)]
    property cache_cluster_status : CacheClusterStatus | Nil

    # A map that defines the method settings for a Stage resource. Keys (designated as
    # `/{method_setting_key` below) are method paths defined as `{resource_path}/{http_method}` for an
    # individual method override, or `/\*/\*` for overriding all methods in the stage.
    @[JSON::Field(key: "methodSettings")]
    property method_settings : Hash(String, MethodSetting) | Nil

    # A map that defines the stage variables for a Stage resource. Variable names can have
    # alphanumeric and underscore characters, and the values must match `[A-Za-z0-9-._~:/?#&=,]+`.
    @[JSON::Field(key: "variables")]
    property variables : Hash(String, String) | Nil

    # The version of the associated API documentation.
    @[JSON::Field(key: "documentationVersion")]
    property documentation_version : String | Nil

    # Settings for logging access in this stage.
    @[JSON::Field(key: "accessLogSettings")]
    property access_log_settings : AccessLogSettings | Nil

    # Settings for the canary deployment in this stage.
    @[JSON::Field(key: "canarySettings")]
    property canary_settings : CanarySettings | Nil

    # Specifies whether active tracing with X-ray is enabled for the Stage.
    @[JSON::Field(key: "tracingEnabled")]
    property tracing_enabled : Bool | Nil

    # The ARN of the WebAcl associated with the Stage.
    @[JSON::Field(key: "webAclArn")]
    property web_acl_arn : String | Nil

    # The collection of tags. Each tag element is associated with a given resource.
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    # The timestamp when the stage was created.
    @[JSON::Field(key: "createdDate", converter: Core::AWSEpochConverter)]
    property created_date : Time | Nil

    # The timestamp when the stage last updated.
    @[JSON::Field(key: "lastUpdatedDate", converter: Core::AWSEpochConverter)]
    property last_updated_date : Time | Nil

    def initialize(
      @deployment_id : String | Nil = nil,
      @client_certificate_id : String | Nil = nil,
      @stage_name : String | Nil = nil,
      @description : String | Nil = nil,
      @cache_cluster_enabled : Bool | Nil = nil,
      @cache_cluster_size : CacheClusterSize | Nil = nil,
      @cache_cluster_status : CacheClusterStatus | Nil = nil,
      @method_settings : Hash(String, MethodSetting) | Nil = nil,
      @variables : Hash(String, String) | Nil = nil,
      @documentation_version : String | Nil = nil,
      @access_log_settings : AccessLogSettings | Nil = nil,
      @canary_settings : CanarySettings | Nil = nil,
      @tracing_enabled : Bool | Nil = nil,
      @web_acl_arn : String | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
      @created_date : Time | Nil = nil,
      @last_updated_date : Time | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @method_settings
        value.each_value(&.validate!)
      end

      if value = @access_log_settings
        value.validate!
      end

      if value = @canary_settings
        value.validate!
      end
    end

    def_equals_and_hash(@deployment_id, @client_certificate_id, @stage_name, @description, @cache_cluster_enabled, @cache_cluster_size, @cache_cluster_status, @method_settings, @variables, @documentation_version, @access_log_settings, @canary_settings, @tracing_enabled, @web_acl_arn, @tags, @created_date, @last_updated_date)
  end
end
