module Amazonite::SsmV1
  class ExecutionInputs
    include JSON::Serializable

    @[JSON::Field(key: "Automation")]
    property automation : AutomationExecutionInputs | Nil

    def initialize(
      @automation : AutomationExecutionInputs | Nil = nil,
    )
    end
  end
end
