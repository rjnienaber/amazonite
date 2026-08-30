module Amazonite::LambdaV1
  # Details about a failed [durable
  # execution](https://docs.aws.amazon.com/lambda/latest/dg/durable-functions.html).
  class ExecutionFailedDetails
    include JSON::Serializable

    # Details about the execution failure.
    @[JSON::Field(key: "Error")]
    property error : EventError

    def initialize(
      @error : EventError,
    )
    end

    def_equals_and_hash(@error)
  end
end
