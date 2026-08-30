module Amazonite::LambdaV1
  class SendDurableExecutionCallbackFailureRequest
    include JSON::Serializable

    # The unique identifier for the callback operation.
    @[JSON::Field(key: "CallbackId", ignore: true)]
    property callback_id : String = ""

    # Error details describing why the callback operation failed.
    @[JSON::Field(key: "Error")]
    property error : ErrorObject | Nil

    def initialize(
      @callback_id : String,
      @error : ErrorObject | Nil = nil,
    )
    end
  end
end
