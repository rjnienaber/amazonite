module Amazonite::LambdaV1
  # Details about a chained invocation that timed out.
  class ChainedInvokeTimedOutDetails
    include JSON::Serializable

    # Details about the chained invocation timeout.
    @[JSON::Field(key: "Error")]
    property error : EventError

    def initialize(
      @error : EventError,
    )
    end
  end
end
