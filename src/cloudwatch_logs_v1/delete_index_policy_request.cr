module Amazonite::CloudWatchLogsV1
  class DeleteIndexPolicyRequest
    include JSON::Serializable

    # The log group to delete the index policy for. You can specify either the name or the ARN of the
    # log group.
    @[JSON::Field(key: "logGroupIdentifier")]
    property log_group_identifier : String

    def initialize(
      @log_group_identifier : String,
    )
    end

    def_equals_and_hash(@log_group_identifier)
  end
end
