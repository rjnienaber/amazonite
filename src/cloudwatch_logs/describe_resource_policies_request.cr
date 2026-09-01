private alias ACWL = Amazonite::CloudWatchLogs
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class DescribeResourcePoliciesRequest
    include JSON::Serializable

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    # The maximum number of resource policies to be displayed with one call of this API.
    @[JSON::Field(key: "limit")]
    property limit : Int32 | Nil

    # The ARN of the CloudWatch Logs resource for which to query the resource policy.
    @[JSON::Field(key: "resourceArn")]
    property resource_arn : String | Nil

    # Specifies the scope of the resource policy. Valid values are `ACCOUNT` or `RESOURCE`. When not
    # specified, defaults to `ACCOUNT`.
    @[JSON::Field(key: "policyScope", converter: ACWL::PolicyScope)]
    property policy_scope : PolicyScope | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @limit : Int32 | Nil = nil,
      @resource_arn : String | Nil = nil,
      @policy_scope : PolicyScope | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end

      if value = @limit
        raise Core::ValidationError.new("limit value must be >= 1") if value < 1
        raise Core::ValidationError.new("limit value must be <= 50") if value > 50
      end
    end

    def_equals_and_hash(@next_token, @limit, @resource_arn, @policy_scope)
  end
end
