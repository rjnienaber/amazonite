module Amazonite::SsmV1
  class StartAutomationExecutionResult
    include JSON::Serializable

    # The unique ID of a newly scheduled automation execution.
    @[JSON::Field(key: "AutomationExecutionId")]
    property automation_execution_id : String | Nil

    def initialize(
      @automation_execution_id : String | Nil = nil,
    )
    end
  end
end
