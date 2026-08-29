module Amazonite::LambdaV1
  class SendDurableExecutionCallbackHeartbeatRequest
    include JSON::Serializable

    @[JSON::Field(key: "CallbackId", ignore: true)]
    property callback_id : String = ""

    def initialize(
      @callback_id : String,
    )
    end
  end
end
