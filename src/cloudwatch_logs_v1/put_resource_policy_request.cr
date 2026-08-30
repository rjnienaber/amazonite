private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class PutResourcePolicyRequest
    include JSON::Serializable

    # Name of the new policy. This parameter is required.
    @[JSON::Field(key: "policyName")]
    property policy_name : String | Nil

    # Details of the new policy, including the identity of the principal that is enabled to put logs
    # to this account. This is formatted as a JSON string. This parameter is required.
    #
    # The following example creates a resource policy enabling the Route 53 service to put DNS query
    # logs in to the specified log group. Replace `"logArn"` with the ARN of your CloudWatch Logs
    # resource, such as a log group or log stream.
    #
    # CloudWatch Logs also supports
    # [aws:SourceArn](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_condition-keys.html#condition-keys-sourcearn)
    # and
    # [aws:SourceAccount](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_condition-keys.html#condition-keys-sourceaccount)
    # condition context keys.
    #
    # In the example resource policy, you would replace the value of `SourceArn` with the resource
    # making the call from Route 53 to CloudWatch Logs. You would also replace the value of
    # `SourceAccount` with the Amazon Web Services account ID making that call.
    #
    # `{ "Version": "2012-10-17", "Statement": [ { "Sid": "Route53LogsToCloudWatchLogs", "Effect":
    # "Allow", "Principal": { "Service": [ "route53.amazonaws.com" ] }, "Action": "logs:PutLogEvents",
    # "Resource": "logArn", "Condition": { "ArnLike": { "aws:SourceArn": "myRoute53ResourceArn" },
    # "StringEquals": { "aws:SourceAccount": "myAwsAccountId" } } } ] }`
    @[JSON::Field(key: "policyDocument")]
    property policy_document : String | Nil

    # The ARN of the CloudWatch Logs resource to which the resource policy needs to be added or
    # attached. Currently only supports LogGroup ARN.
    @[JSON::Field(key: "resourceArn")]
    property resource_arn : String | Nil

    # The expected revision ID of the resource policy. Required when `resourceArn` is provided to
    # prevent concurrent modifications. Use `null` when creating a resource policy for the first time.
    @[JSON::Field(key: "expectedRevisionId")]
    property expected_revision_id : String | Nil

    def initialize(
      @policy_name : String | Nil = nil,
      @policy_document : String | Nil = nil,
      @resource_arn : String | Nil = nil,
      @expected_revision_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @policy_document
        raise Core::ValidationError.new("policyDocument length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("policyDocument length must be <= 51200") if value.size > 51200
      end

      if value = @expected_revision_id
        raise Core::ValidationError.new("expectedRevisionId length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@policy_name, @policy_document, @resource_arn, @expected_revision_id)
  end
end
