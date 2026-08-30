private alias AAG = Amazonite::ApiGatewayV1

module Amazonite::ApiGatewayV1
  # Specifies the method setting properties.
  class MethodSetting
    include JSON::Serializable

    # Specifies whether Amazon CloudWatch metrics are enabled for this method.
    @[JSON::Field(key: "metricsEnabled")]
    property metrics_enabled : Bool | Nil

    # Specifies the logging level for this method, which affects the log entries pushed to Amazon
    # CloudWatch Logs. Valid values are `OFF`, `ERROR`, and `INFO`. Choose `ERROR` to write only
    # error-level entries to CloudWatch Logs, or choose `INFO` to include all `ERROR` events as well
    # as extra informational events.
    @[JSON::Field(key: "loggingLevel")]
    property logging_level : String | Nil

    # Specifies whether data trace logging is enabled for this method, which affects the log entries
    # pushed to Amazon CloudWatch Logs. This can be useful to troubleshoot APIs, but can result in
    # logging sensitive data. We recommend that you don't enable this option for production APIs.
    @[JSON::Field(key: "dataTraceEnabled")]
    property data_trace_enabled : Bool | Nil

    # Specifies the throttling burst limit.
    @[JSON::Field(key: "throttlingBurstLimit")]
    property throttling_burst_limit : Int32 | Nil

    # Specifies the throttling rate limit.
    @[JSON::Field(key: "throttlingRateLimit")]
    property throttling_rate_limit : Float64 | Nil

    # Specifies whether responses should be cached and returned for requests. A cache cluster must be
    # enabled on the stage for responses to be cached.
    @[JSON::Field(key: "cachingEnabled")]
    property caching_enabled : Bool | Nil

    # Specifies the time to live (TTL), in seconds, for cached responses. The higher the TTL, the
    # longer the response will be cached.
    @[JSON::Field(key: "cacheTtlInSeconds")]
    property cache_ttl_in_seconds : Int32 | Nil

    # Specifies whether the cached responses are encrypted.
    @[JSON::Field(key: "cacheDataEncrypted")]
    property cache_data_encrypted : Bool | Nil

    # Specifies whether authorization is required for a cache invalidation request.
    @[JSON::Field(key: "requireAuthorizationForCacheControl")]
    property require_authorization_for_cache_control : Bool | Nil

    # Specifies how to handle unauthorized requests for cache invalidation.
    @[JSON::Field(key: "unauthorizedCacheControlHeaderStrategy", converter: AAG::UnauthorizedCacheControlHeaderStrategy)]
    property unauthorized_cache_control_header_strategy : UnauthorizedCacheControlHeaderStrategy | Nil

    def initialize(
      @metrics_enabled : Bool | Nil = nil,
      @logging_level : String | Nil = nil,
      @data_trace_enabled : Bool | Nil = nil,
      @throttling_burst_limit : Int32 | Nil = nil,
      @throttling_rate_limit : Float64 | Nil = nil,
      @caching_enabled : Bool | Nil = nil,
      @cache_ttl_in_seconds : Int32 | Nil = nil,
      @cache_data_encrypted : Bool | Nil = nil,
      @require_authorization_for_cache_control : Bool | Nil = nil,
      @unauthorized_cache_control_header_strategy : UnauthorizedCacheControlHeaderStrategy | Nil = nil,
    )
    end
  end
end
