private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class StopAutomationExecutionRequest
    include JSON::Serializable

    @[JSON::Field(key: "AutomationExecutionId")]
    property automation_execution_id : String

    @[JSON::Field(key: "Type", converter: AS::StopType)]
    property type : StopType | Nil

    def initialize(
      @automation_execution_id : String,
      @type : StopType | Nil = nil
    )
    end
  end
end
