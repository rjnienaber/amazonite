module Amazonite::SsmV1
  class DescribeAutomationStepExecutionsResult
    include JSON::Serializable

    @[JSON::Field(key: "StepExecutions")]
    property step_executions : Array(StepExecution) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @step_executions : Array(StepExecution) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
