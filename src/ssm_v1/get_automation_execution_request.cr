module Amazonite::SsmV1
  class GetAutomationExecutionRequest
    include JSON::Serializable

    @[JSON::Field(key: "AutomationExecutionId")]
    property automation_execution_id : String

    def initialize(
      @automation_execution_id : String
    )
    end
  end
end
