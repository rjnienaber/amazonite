module Amazonite::CloudWatchLogsV1
  class DeleteDataProtectionPolicyRequest
    include JSON::Serializable

    # The name or ARN of the log group that you want to delete the data protection policy for.
    @[JSON::Field(key: "logGroupIdentifier")]
    property log_group_identifier : String

    def initialize(
      @log_group_identifier : String,
    )
    end

    def_equals_and_hash(@log_group_identifier)
  end
end
