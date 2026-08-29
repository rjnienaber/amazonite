module Amazonite::SsmV1
  class ExecutionPreview
    include JSON::Serializable

    @[JSON::Field(key: "Automation")]
    property automation : AutomationExecutionPreview | Nil

    def initialize(
      @automation : AutomationExecutionPreview | Nil = nil,
    )
    end
  end
end
