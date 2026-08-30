module Amazonite::LambdaV1
  class SendDurableExecutionCallbackHeartbeatRequest
    include JSON::Serializable

    # The unique identifier for the callback operation.
    @[JSON::Field(key: "CallbackId", ignore: true)]
    property callback_id : String = ""

    def initialize(
      @callback_id : String,
    )
    end

    def_equals_and_hash(@callback_id)
  end
end
