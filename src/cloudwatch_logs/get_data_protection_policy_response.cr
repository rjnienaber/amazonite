private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class GetDataProtectionPolicyResponse
    include JSON::Serializable

    # The log group name or ARN that you specified in your request.
    @[JSON::Field(key: "logGroupIdentifier")]
    property log_group_identifier : String | Nil

    # The data protection policy document for this log group.
    @[JSON::Field(key: "policyDocument")]
    property policy_document : String | Nil

    # The date and time that this policy was most recently updated.
    @[JSON::Field(key: "lastUpdatedTime")]
    property last_updated_time : Int64 | Nil

    def initialize(
      @log_group_identifier : String | Nil = nil,
      @policy_document : String | Nil = nil,
      @last_updated_time : Int64 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @log_group_identifier
        raise Core::ValidationError.new("logGroupIdentifier length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logGroupIdentifier length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("logGroupIdentifier does not match the required pattern") unless value.matches?(Regex.new("^[\\w#+=/:,.@-]*$"))
      end

      if value = @last_updated_time
        raise Core::ValidationError.new("lastUpdatedTime value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@log_group_identifier, @policy_document, @last_updated_time)
  end
end
