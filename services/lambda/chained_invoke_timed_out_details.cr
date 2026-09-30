private alias Core = Amazonite::Core

module Amazonite::Lambda
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

    def validate! : Nil
      if value = @error
        value.validate!
      end
    end

    def_equals_and_hash(@error)
  end
end
