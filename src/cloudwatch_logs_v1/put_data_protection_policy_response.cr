module Amazonite::CloudWatchLogsV1
  class PutDataProtectionPolicyResponse
    include JSON::Serializable

    # The log group name or ARN that you specified in your request.
    @[JSON::Field(key: "logGroupIdentifier")]
    property log_group_identifier : String | Nil

    # The data protection policy used for this log group.
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

    def_equals_and_hash(@log_group_identifier, @policy_document, @last_updated_time)
  end
end
