module Amazonite::CloudWatchLogsV1
  class PutRetentionPolicyRequest
    include JSON::Serializable

    # The name of the log group.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String

    @[JSON::Field(key: "retentionInDays")]
    property retention_in_days : Int32

    def initialize(
      @log_group_name : String,
      @retention_in_days : Int32,
    )
    end

    def_equals_and_hash(@log_group_name, @retention_in_days)
  end
end
