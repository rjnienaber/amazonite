private alias Core = Amazonite::Core

module Amazonite::Lambda
  # Details about a context that failed.
  class ContextFailedDetails
    include JSON::Serializable

    # Details about the context failure.
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
