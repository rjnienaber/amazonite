private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class DeleteAccountPolicyResponse
    include JSON::Serializable

    # The estimated impact of deleting the policy. This field is returned only when the request
    # specifies `dryRun` as `true`.
    @[JSON::Field(key: "dryRunResult")]
    property dry_run_result : DryRunResult | Nil

    def initialize(
      @dry_run_result : DryRunResult | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @dry_run_result
        value.validate!
      end
    end

    def_equals_and_hash(@dry_run_result)
  end
end
