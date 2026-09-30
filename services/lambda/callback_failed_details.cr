private alias Core = Amazonite::Core

module Amazonite::Lambda
  # Contains details about a failed callback operation, including error information and the reason
  # for failure.
  class CallbackFailedDetails
    include JSON::Serializable

    # An error object that contains details about the failure.
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
