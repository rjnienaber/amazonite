module Amazonite::CloudWatchLogsV1
  class PutLogGroupDeletionProtectionRequest
    include JSON::Serializable

    # The name or ARN of the log group.
    #
    # Type: String
    #
    # Length Constraints: Minimum length of 1. Maximum length of 512.
    #
    # Pattern: `[\.\-_/#A-Za-z0-9]+`
    #
    # Required: Yes
    @[JSON::Field(key: "logGroupIdentifier")]
    property log_group_identifier : String

    # Whether to enable deletion protection.
    #
    # Type: Boolean
    #
    # Required: Yes
    @[JSON::Field(key: "deletionProtectionEnabled")]
    property deletion_protection_enabled : Bool

    def initialize(
      @log_group_identifier : String,
      @deletion_protection_enabled : Bool,
    )
    end
  end
end
