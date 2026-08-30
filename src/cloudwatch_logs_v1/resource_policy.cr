private alias ACWL = Amazonite::CloudWatchLogsV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  # A policy enabling one or more entities to put logs to a log group in this account.
  class ResourcePolicy
    include JSON::Serializable

    # The name of the resource policy.
    @[JSON::Field(key: "policyName")]
    property policy_name : String | Nil

    # The details of the policy.
    @[JSON::Field(key: "policyDocument")]
    property policy_document : String | Nil

    # Timestamp showing when this policy was last updated, expressed as the number of milliseconds
    # after `Jan 1, 1970 00:00:00 UTC`.
    @[JSON::Field(key: "lastUpdatedTime")]
    property last_updated_time : Int64 | Nil

    # Specifies scope of the resource policy. Valid values are ACCOUNT or RESOURCE.
    @[JSON::Field(key: "policyScope", converter: ACWL::PolicyScope)]
    property policy_scope : PolicyScope | Nil

    # The ARN of the CloudWatch Logs resource to which the resource policy is attached. Only populated
    # for resource-scoped policies.
    @[JSON::Field(key: "resourceArn")]
    property resource_arn : String | Nil

    # The revision ID of the resource policy. Only populated for resource-scoped policies.
    @[JSON::Field(key: "revisionId")]
    property revision_id : String | Nil

    def initialize(
      @policy_name : String | Nil = nil,
      @policy_document : String | Nil = nil,
      @last_updated_time : Int64 | Nil = nil,
      @policy_scope : PolicyScope | Nil = nil,
      @resource_arn : String | Nil = nil,
      @revision_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @policy_document
        raise Core::ValidationError.new("policyDocument length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("policyDocument length must be <= 51200") if value.size > 51200
      end

      if value = @last_updated_time
        raise Core::ValidationError.new("lastUpdatedTime value must be >= 0") if value < 0
      end

      if value = @revision_id
        raise Core::ValidationError.new("revisionId length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@policy_name, @policy_document, @last_updated_time, @policy_scope, @resource_arn, @revision_id)
  end
end
