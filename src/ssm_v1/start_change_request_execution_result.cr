module Amazonite::SsmV1
  class StartChangeRequestExecutionResult
    include JSON::Serializable

    @[JSON::Field(key: "AutomationExecutionId")]
    property automation_execution_id : String | Nil

    def initialize(
      @automation_execution_id : String | Nil = nil
    )
    end
  end
end
