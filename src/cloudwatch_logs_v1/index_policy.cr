private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  # This structure contains information about one field index policy in this account.
  class IndexPolicy
    include JSON::Serializable

    # The ARN of the log group that this index policy applies to.
    @[JSON::Field(key: "logGroupIdentifier")]
    property log_group_identifier : String | Nil

    # The date and time that this index policy was most recently updated.
    @[JSON::Field(key: "lastUpdateTime")]
    property last_update_time : Int64 | Nil

    # The policy document for this index policy, in JSON format.
    @[JSON::Field(key: "policyDocument")]
    property policy_document : String | Nil

    # The name of this policy. Responses about log group-level field index policies don't have this
    # field, because those policies don't have names.
    @[JSON::Field(key: "policyName")]
    property policy_name : String | Nil

    # This field indicates whether this is an account-level index policy or an index policy that
    # applies only to a single log group.
    @[JSON::Field(key: "source", converter: ACWL::IndexSource)]
    property source : IndexSource | Nil

    def initialize(
      @log_group_identifier : String | Nil = nil,
      @last_update_time : Int64 | Nil = nil,
      @policy_document : String | Nil = nil,
      @policy_name : String | Nil = nil,
      @source : IndexSource | Nil = nil,
    )
    end
  end
end
