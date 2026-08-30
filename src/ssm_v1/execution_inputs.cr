module Amazonite::SsmV1
  # Information about the inputs for an execution preview.
  class ExecutionInputs
    include JSON::Serializable

    # Information about the optional inputs that can be specified for an automation execution preview.
    @[JSON::Field(key: "Automation")]
    property automation : AutomationExecutionInputs | Nil

    def initialize(
      @automation : AutomationExecutionInputs | Nil = nil,
    )
    end

    def_equals_and_hash(@automation)
  end
end
