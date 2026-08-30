private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @automation_execution_id
        raise Core::ValidationError.new("AutomationExecutionId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("AutomationExecutionId length must be <= 36") if value.size > 36
      end
    end

    def_equals_and_hash(@automation_execution_id)
  end
end
