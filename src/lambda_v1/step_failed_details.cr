module Amazonite::LambdaV1
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
  end
end
