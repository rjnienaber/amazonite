private alias ACWL = Amazonite::CloudWatchLogsV1

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

    def_equals_and_hash(@policy_name, @policy_document, @last_updated_time, @policy_scope, @resource_arn, @revision_id)
  end
end
