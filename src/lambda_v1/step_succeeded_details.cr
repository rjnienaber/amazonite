module Amazonite::LambdaV1
  # Details about a step that succeeded.
  class StepSucceededDetails
    include JSON::Serializable

    # The response payload from the successful operation.
    @[JSON::Field(key: "Result")]
    property result : EventResult

    # Information about retry attempts for this step operation.
    @[JSON::Field(key: "RetryDetails")]
    property retry_details : RetryDetails

    def initialize(
      @result : EventResult,
      @retry_details : RetryDetails,
    )
    end

    def_equals_and_hash(@result, @retry_details)
  end
end
