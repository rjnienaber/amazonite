module Amazonite::LambdaV1
  class SendDurableExecutionCallbackSuccessRequest
    include JSON::Serializable

    @[JSON::Field(key: "CallbackId", ignore: true)]
    property callback_id : String = ""

    @[JSON::Field(key: "Result")]
    property result : String | Nil

    def initialize(
      @callback_id : String,
      @result : String | Nil = nil,
    )
    end
  end
end
