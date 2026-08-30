module Amazonite::LambdaV1
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

    def_equals_and_hash(@timeout_seconds, @heartbeat_timeout_seconds)
  end
end
