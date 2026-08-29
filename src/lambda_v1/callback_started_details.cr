module Amazonite::LambdaV1
  class CallbackStartedDetails
    include JSON::Serializable

    @[JSON::Field(key: "CallbackId")]
    property callback_id : String

    @[JSON::Field(key: "HeartbeatTimeout")]
    property heartbeat_timeout : Int32 | Nil

    @[JSON::Field(key: "Timeout")]
    property timeout : Int32 | Nil

    def initialize(
      @callback_id : String,
      @heartbeat_timeout : Int32 | Nil = nil,
      @timeout : Int32 | Nil = nil,
    )
    end
  end
end
