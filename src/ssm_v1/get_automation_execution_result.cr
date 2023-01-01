module Amazonite::SsmV1
  class GetAutomationExecutionResult
    include JSON::Serializable

    @[JSON::Field(key: "AutomationExecution")]
    property automation_execution : AutomationExecution | Nil

    def initialize(
      @automation_execution : AutomationExecution | Nil = nil
    )
    end
  end
end
