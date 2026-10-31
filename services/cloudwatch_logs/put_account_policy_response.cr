private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class PutAccountPolicyResponse
    include JSON::Serializable

    # The account policy that you created.
    @[JSON::Field(key: "accountPolicy")]
    property account_policy : AccountPolicy | Nil

    # The estimated impact of the policy on log groups in the account. This field is returned only
    # when the request specifies `dryRun` as `true`.
    @[JSON::Field(key: "dryRunResult")]
    property dry_run_result : DryRunResult | Nil

    def initialize(
      @account_policy : AccountPolicy | Nil = nil,
      @dry_run_result : DryRunResult | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @account_policy
        value.validate!
      end

      if value = @dry_run_result
        value.validate!
      end
    end

    def_equals_and_hash(@account_policy, @dry_run_result)
  end
end
