private alias Core = Amazonite::Core

module Amazonite::Lambda
  # Configuration options for callback operations in durable executions, including timeout settings
  # and retry behavior.
  class CallbackOptions
    include JSON::Serializable

    # The timeout for the callback operation in seconds. If not specified or set to 0, the callback
    # has no timeout.
    @[JSON::Field(key: "TimeoutSeconds")]
    property timeout_seconds : Int32 | Nil

    # The heartbeat timeout for the callback operation, in seconds. If not specified or set to 0,
    # heartbeat timeout is disabled.
    @[JSON::Field(key: "HeartbeatTimeoutSeconds")]
    property heartbeat_timeout_seconds : Int32 | Nil

    def initialize(
      @timeout_seconds : Int32 | Nil = nil,
      @heartbeat_timeout_seconds : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @timeout_seconds
        raise Core::ValidationError.new("TimeoutSeconds value must be >= 0") if value < 0
      end

      if value = @heartbeat_timeout_seconds
        raise Core::ValidationError.new("HeartbeatTimeoutSeconds value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@timeout_seconds, @heartbeat_timeout_seconds)
  end
end
