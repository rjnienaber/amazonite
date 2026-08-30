module Amazonite::LambdaV1
  # Details about a durable execution that started.
  class ExecutionStartedDetails
    include JSON::Serializable

    # The input payload provided for the durable execution.
    @[JSON::Field(key: "Input")]
    property input : EventInput

    # The maximum amount of time that the durable execution is allowed to run, in seconds.
    @[JSON::Field(key: "ExecutionTimeout")]
    property execution_timeout : Int32

    def initialize(
      @input : EventInput,
      @execution_timeout : Int32,
    )
    end

    def_equals_and_hash(@input, @execution_timeout)
  end
end
