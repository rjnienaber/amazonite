module Amazonite::LambdaV1
  # Contains details about a failed chained function invocation, including error information and
  # failure reason.
  class ChainedInvokeFailedDetails
    include JSON::Serializable

    # Details about the chained invocation failure.
    @[JSON::Field(key: "Error")]
    property error : EventError

    def initialize(
      @error : EventError,
    )
    end

    def_equals_and_hash(@error)
  end
end
