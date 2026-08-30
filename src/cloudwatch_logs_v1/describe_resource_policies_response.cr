module Amazonite::CloudWatchLogsV1
  class DescribeResourcePoliciesResponse
    include JSON::Serializable

    # The resource policies that exist in this account.
    @[JSON::Field(key: "resourcePolicies")]
    property resource_policies : Array(ResourcePolicy) | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @resource_policies : Array(ResourcePolicy) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
