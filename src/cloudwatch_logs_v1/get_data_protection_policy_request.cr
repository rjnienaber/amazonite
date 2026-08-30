module Amazonite::CloudWatchLogsV1
  class GetDataProtectionPolicyRequest
    include JSON::Serializable

    # The name or ARN of the log group that contains the data protection policy that you want to see.
    @[JSON::Field(key: "logGroupIdentifier")]
    property log_group_identifier : String

    def initialize(
      @log_group_identifier : String,
    )
    end

    def_equals_and_hash(@log_group_identifier)
  end
end
