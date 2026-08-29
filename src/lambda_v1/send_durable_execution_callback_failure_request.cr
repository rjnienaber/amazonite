module Amazonite::LambdaV1
  class SendDurableExecutionCallbackFailureRequest
    include JSON::Serializable

    @[JSON::Field(key: "CallbackId", ignore: true)]
    property callback_id : String = ""

    @[JSON::Field(key: "Error")]
    property error : ErrorObject | Nil

    def initialize(
      @callback_id : String,
      @error : ErrorObject | Nil = nil,
    )
    end
  end
end
