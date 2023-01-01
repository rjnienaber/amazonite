module Amazonite::SsmV1
  class DescribeAutomationExecutionsResult
    include JSON::Serializable

    @[JSON::Field(key: "AutomationExecutionMetadataList")]
    property automation_execution_metadata_list : Array(AutomationExecutionMetadata) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @automation_execution_metadata_list : Array(AutomationExecutionMetadata) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
