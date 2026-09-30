private alias Core = Amazonite::Core

module Amazonite::Ssm
  class DescribeAutomationStepExecutionsResult
    include JSON::Serializable

    # A list of details about the current state of all steps that make up an execution.
    @[JSON::Field(key: "StepExecutions")]
    property step_executions : Array(StepExecution) | Nil

    # The token to use when requesting the next set of items. If there are no additional items to
    # return, the string is empty.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @step_executions : Array(StepExecution) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @step_executions
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@step_executions, @next_token)
  end
end
