module Amazonite::LambdaV1
  class SendDurableExecutionCallbackSuccessRequest
    include JSON::Serializable

    # The unique identifier for the callback operation.
    @[JSON::Field(key: "CallbackId", ignore: true)]
    property callback_id : String = ""

    # The result data from the successful callback operation. Maximum size is 256 KB.
    @[JSON::Field(key: "Result")]
    property result : String | Nil

    def initialize(
      @callback_id : String,
      @result : String | Nil = nil,
    )
    end

    def_equals_and_hash(@callback_id, @result)
  end
end
