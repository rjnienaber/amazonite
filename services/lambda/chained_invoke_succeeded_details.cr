private alias Core = Amazonite::Core

module Amazonite::Lambda
  # Details about a chained invocation that succeeded.
  class ChainedInvokeSucceededDetails
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
