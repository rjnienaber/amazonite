private alias Core = Amazonite::Core

module Amazonite::EventBridge
  # The failover configuration for an endpoint. This includes what triggers failover and what
  # happens when it's triggered.
  class FailoverConfig
    include JSON::Serializable

    # The main Region of the endpoint.
    @[JSON::Field(key: "Primary")]
    property primary : Primary

    # The Region that events are routed to when failover is triggered or event replication is enabled.
    @[JSON::Field(key: "Secondary")]
    property secondary : Secondary

    def initialize(
      @primary : Primary,
      @secondary : Secondary,
    )
    end

    def validate! : Nil
      if value = @primary
        value.validate!
      end

      if value = @secondary
        value.validate!
      end
    end

    def_equals_and_hash(@primary, @secondary)
  end
end
