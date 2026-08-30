module Amazonite::SsmV1
  class GetAutomationExecutionRequest
    include JSON::Serializable

    # The unique identifier for an existing automation execution to examine. The execution ID is
    # returned by StartAutomationExecution when the execution of an Automation runbook is initiated.
    @[JSON::Field(key: "AutomationExecutionId")]
    property automation_execution_id : String

    def initialize(
      @automation_execution_id : String,
    )
    end
  end
end
