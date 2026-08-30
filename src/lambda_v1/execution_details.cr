module Amazonite::LambdaV1
  # Details about a [durable
  # execution](https://docs.aws.amazon.com/lambda/latest/dg/durable-functions.html).
  class ExecutionDetails
    include JSON::Serializable

    # The original input payload provided for the durable execution.
    @[JSON::Field(key: "InputPayload")]
    property input_payload : String | Nil

    def initialize(
      @input_payload : String | Nil = nil,
    )
    end

    def_equals_and_hash(@input_payload)
  end
end
