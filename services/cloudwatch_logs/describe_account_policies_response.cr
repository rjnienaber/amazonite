private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class DescribeAccountPoliciesResponse
    include JSON::Serializable

    # An array of structures that contain information about the CloudWatch Logs account policies that
    # match the specified filters.
    @[JSON::Field(key: "accountPolicies")]
    property account_policies : Array(AccountPolicy) | Nil

    # The token to use when requesting the next set of items. The token expires after 24 hours.
    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @account_policies : Array(AccountPolicy) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @account_policies
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@account_policies, @next_token)
  end
end
