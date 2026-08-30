private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  class DeleteAccountPolicyRequest
    include JSON::Serializable

    # The name of the policy to delete.
    @[JSON::Field(key: "policyName")]
    property policy_name : String

    # The type of policy to delete.
    @[JSON::Field(key: "policyType", converter: ACWL::PolicyType)]
    property policy_type : PolicyType

    def initialize(
      @policy_name : String,
      @policy_type : PolicyType,
    )
    end

    def_equals_and_hash(@policy_name, @policy_type)
  end
end
