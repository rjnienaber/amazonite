private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @callback_id
        raise Core::ValidationError.new("CallbackId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CallbackId length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("CallbackId does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z0-9+/]+={0,2}$"))
      end

      if value = @result
        raise Core::ValidationError.new("Result length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Result length must be <= 262144") if value.size > 262144
      end
    end

    def_equals_and_hash(@callback_id, @result)
  end
end
