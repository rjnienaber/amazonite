private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # Details about a [durable
  # execution](https://docs.aws.amazon.com/lambda/latest/dg/durable-functions.html) that stopped.
  class ExecutionStoppedDetails
    include JSON::Serializable

    # Details about why the execution stopped.
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
