private alias Core = Amazonite::Core

module Amazonite::Ssm
  class StartChangeRequestExecutionResult
    include JSON::Serializable

    # The unique ID of a runbook workflow operation. (A runbook workflow is a type of Automation
    # operation.)
    @[JSON::Field(key: "AutomationExecutionId")]
    property automation_execution_id : String | Nil

    def initialize(
      @automation_execution_id : String | Nil = nil,
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
