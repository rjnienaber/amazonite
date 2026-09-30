private alias Core = Amazonite::Core

module Amazonite::Lambda
  # Details about a step that failed.
  class StepFailedDetails
    include JSON::Serializable

    # Details about the step failure.
    @[JSON::Field(key: "Error")]
    property error : EventError

    # Information about retry attempts for this step operation.
    @[JSON::Field(key: "RetryDetails")]
    property retry_details : RetryDetails

    def initialize(
      @error : EventError,
      @retry_details : RetryDetails,
    )
    end

    def validate! : Nil
      if value = @error
        value.validate!
      end

      if value = @retry_details
        value.validate!
      end
    end

    def_equals_and_hash(@error, @retry_details)
  end
end
