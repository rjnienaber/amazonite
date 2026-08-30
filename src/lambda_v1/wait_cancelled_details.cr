private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # Details about a wait operation that was cancelled.
  class WaitCancelledDetails
    include JSON::Serializable

    # Details about why the wait operation was cancelled.
    @[JSON::Field(key: "Error")]
    property error : EventError | Nil

    def initialize(
      @error : EventError | Nil = nil,
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
