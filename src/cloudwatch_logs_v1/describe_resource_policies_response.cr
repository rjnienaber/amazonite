private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @resource_policies
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@resource_policies, @next_token)
  end
end
