module Amazonite::EventBridgeV1
  # The routing configuration of the endpoint.
  class RoutingConfig
    include JSON::Serializable

    # The failover configuration for an endpoint. This includes what triggers failover and what
    # happens when it's triggered.
    @[JSON::Field(key: "FailoverConfig")]
    property failover_config : FailoverConfig

    def initialize(
      @failover_config : FailoverConfig,
    )
    end

    def_equals_and_hash(@failover_config)
  end
end
