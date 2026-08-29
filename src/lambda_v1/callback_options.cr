module Amazonite::LambdaV1
  class CallbackOptions
    include JSON::Serializable

    @[JSON::Field(key: "TimeoutSeconds")]
    property timeout_seconds : Int32 | Nil

    @[JSON::Field(key: "HeartbeatTimeoutSeconds")]
    property heartbeat_timeout_seconds : Int32 | Nil

    def initialize(
      @timeout_seconds : Int32 | Nil = nil,
      @heartbeat_timeout_seconds : Int32 | Nil = nil,
    )
    end
  end
end
