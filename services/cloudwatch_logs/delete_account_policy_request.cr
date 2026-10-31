private alias ACWL = Amazonite::CloudWatchLogs

module Amazonite::CloudWatchLogs
  class DeleteAccountPolicyRequest
    include JSON::Serializable

    # The name of the policy to delete.
    @[JSON::Field(key: "policyName")]
    property policy_name : String

    # The type of policy to delete.
    @[JSON::Field(key: "policyType", converter: ACWL::PolicyType)]
    property policy_type : PolicyType

    # Specifies whether to preview the impact of deleting the policy without deleting it. If you
    # specify `true`, CloudWatch Logs does not delete the policy and returns the estimated impact in
    # `dryRunResult`. The default is `false`.
    #
    # Specifying `dryRun` is valid only when you specify `RETENTION_POLICY` for `policyType`. Only one
    # dry run can be in progress for an account at a time.
    @[JSON::Field(key: "dryRun")]
    property dry_run : Bool | Nil

    def initialize(
      @policy_name : String,
      @policy_type : PolicyType,
      @dry_run : Bool | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@policy_name, @policy_type, @dry_run)
  end
end
