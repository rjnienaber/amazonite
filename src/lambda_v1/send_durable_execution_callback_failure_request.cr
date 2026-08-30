private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @callback_id
        raise Core::ValidationError.new("CallbackId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CallbackId length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("CallbackId does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z0-9+/]+={0,2}$"))
      end

      if value = @error
        value.validate!
      end
    end

    def_equals_and_hash(@callback_id, @error)
  end
end
