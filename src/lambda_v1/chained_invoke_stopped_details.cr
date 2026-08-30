private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # Details about a chained invocation that was stopped.
  class ChainedInvokeStoppedDetails
    include JSON::Serializable

    # Details about why the chained invocation stopped.
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
