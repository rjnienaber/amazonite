private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
  class StopAutomationExecutionRequest
    include JSON::Serializable

    # The execution ID of the Automation to stop.
    @[JSON::Field(key: "AutomationExecutionId")]
    property automation_execution_id : String

    # The stop request type. Valid types include the following: Cancel and Complete. The default type
    # is Cancel.
    @[JSON::Field(key: "Type", converter: AS::StopType)]
    property type : StopType | Nil

    def initialize(
      @automation_execution_id : String,
      @type : StopType | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @automation_execution_id
        raise Core::ValidationError.new("AutomationExecutionId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("AutomationExecutionId length must be <= 36") if value.size > 36
      end
    end

    def_equals_and_hash(@automation_execution_id, @type)
  end
end
