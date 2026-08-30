module Amazonite::LambdaV1
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

    def_equals_and_hash(@result)
  end
end
