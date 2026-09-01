private alias Core = Amazonite::Core

module Amazonite::Lambda
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

    def validate! : Nil
      if value = @input_payload
        raise Core::ValidationError.new("InputPayload length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("InputPayload length must be <= 6291456") if value.size > 6291456
      end
    end

    def_equals_and_hash(@input_payload)
  end
end
