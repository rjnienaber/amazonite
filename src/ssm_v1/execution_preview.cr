module Amazonite::SsmV1
  # Information about the changes that would be made if an execution were run.
  class ExecutionPreview
    include JSON::Serializable

    # Information about the changes that would be made if an Automation workflow were run.
    @[JSON::Field(key: "Automation")]
    property automation : AutomationExecutionPreview | Nil

    def initialize(
      @automation : AutomationExecutionPreview | Nil = nil,
    )
    end

    def_equals_and_hash(@automation)
  end
end
