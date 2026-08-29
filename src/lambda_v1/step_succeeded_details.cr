module Amazonite::LambdaV1
  class StepSucceededDetails
    include JSON::Serializable

    @[JSON::Field(key: "Result")]
    property result : EventResult

    @[JSON::Field(key: "RetryDetails")]
    property retry_details : RetryDetails

    def initialize(
      @result : EventResult,
      @retry_details : RetryDetails,
    )
    end
  end
end
