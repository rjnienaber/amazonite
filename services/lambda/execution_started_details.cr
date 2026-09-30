private alias Core = Amazonite::Core

module Amazonite::Lambda
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

    def validate! : Nil
      if value = @input
        value.validate!
      end

      if value = @execution_timeout
        raise Core::ValidationError.new("ExecutionTimeout value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@input, @execution_timeout)
  end
end
