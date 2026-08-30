private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @log_group_name
        raise Core::ValidationError.new("logGroupName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logGroupName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("logGroupName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_/#A-Za-z0-9]+$"))
      end
    end

    def_equals_and_hash(@log_group_name, @retention_in_days)
  end
end
