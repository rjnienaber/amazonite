private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  class DescribeAccountPoliciesRequest
    include JSON::Serializable

    # Use this parameter to limit the returned policies to only the policies that match the policy
    # type that you specify.
    @[JSON::Field(key: "policyType", converter: ACWL::PolicyType)]
    property policy_type : PolicyType

    # Use this parameter to limit the returned policies to only the policy with the name that you
    # specify.
    @[JSON::Field(key: "policyName")]
    property policy_name : String | Nil

    # If you are using an account that is set up as a monitoring account for CloudWatch unified
    # cross-account observability, you can use this to specify the account ID of a source account. If
    # you do, the operation returns the account policy for the specified account. Currently, you can
    # specify only one account ID in this parameter.
    #
    # If you omit this parameter, only the policy in the current account is returned.
    @[JSON::Field(key: "accountIdentifiers")]
    property account_identifiers : Array(String) | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @policy_type : PolicyType,
      @policy_name : String | Nil = nil,
      @account_identifiers : Array(String) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
