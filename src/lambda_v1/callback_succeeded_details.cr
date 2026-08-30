private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # Contains details about a successfully completed callback operation, including the result data
  # and completion timestamp.
  class CallbackSucceededDetails
    include JSON::Serializable

    # The response payload from the successful operation.
    @[JSON::Field(key: "Result")]
    property result : EventResult

    def initialize(
      @result : EventResult,
    )
    end

    def validate! : Nil
      if value = @result
        value.validate!
      end
    end

    def_equals_and_hash(@result)
  end
end
