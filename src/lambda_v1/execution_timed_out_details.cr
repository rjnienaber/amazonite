module Amazonite::LambdaV1
  # Details about a [durable
  # execution](https://docs.aws.amazon.com/lambda/latest/dg/durable-functions.html) that timed out.
  class ExecutionTimedOutDetails
    include JSON::Serializable

    # Details about the execution timeout.
    @[JSON::Field(key: "Error")]
    property error : EventError | Nil

    def initialize(
      @error : EventError | Nil = nil,
    )
    end

    def_equals_and_hash(@error)
  end
end
