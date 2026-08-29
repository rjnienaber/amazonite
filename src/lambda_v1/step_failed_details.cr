module Amazonite::LambdaV1
  class StepFailedDetails
    include JSON::Serializable

    @[JSON::Field(key: "Error")]
    property error : EventError

    @[JSON::Field(key: "RetryDetails")]
    property retry_details : RetryDetails

    def initialize(
      @error : EventError,
      @retry_details : RetryDetails,
    )
    end
  end
end
