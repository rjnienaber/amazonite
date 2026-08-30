private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class DescribeAutomationExecutionsResult
    include JSON::Serializable

    # The list of details about each automation execution which has occurred which matches the filter
    # specification, if any.
    @[JSON::Field(key: "AutomationExecutionMetadataList")]
    property automation_execution_metadata_list : Array(AutomationExecutionMetadata) | Nil

    # The token to use when requesting the next set of items. If there are no additional items to
    # return, the string is empty.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @automation_execution_metadata_list : Array(AutomationExecutionMetadata) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @automation_execution_metadata_list
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@automation_execution_metadata_list, @next_token)
  end
end
