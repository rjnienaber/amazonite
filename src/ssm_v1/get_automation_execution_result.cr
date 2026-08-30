module Amazonite::SsmV1
  class GetAutomationExecutionResult
    include JSON::Serializable

    # Detailed information about the current state of an automation execution.
    @[JSON::Field(key: "AutomationExecution")]
    property automation_execution : AutomationExecution | Nil

    def initialize(
      @automation_execution : AutomationExecution | Nil = nil,
    )
    end

    def_equals_and_hash(@automation_execution)
  end
end
