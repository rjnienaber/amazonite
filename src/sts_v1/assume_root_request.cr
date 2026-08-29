private alias Core = Amazonite::Core

module Amazonite::StsV1
  class AssumeRootRequest
    # The member account principal ARN or account ID.
    property target_principal : String

    # The identity based policy that scopes the session to the privileged tasks that can be performed.
    # You must use one of following Amazon Web Services managed policies to scope root session
    # actions:
    #
    # -
    # [IAMAuditRootUserCredentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/security-iam-awsmanpol.html#security-iam-awsmanpol-IAMAuditRootUserCredentials)
    #
    # -
    # [IAMCreateRootUserPassword](https://docs.aws.amazon.com/IAM/latest/UserGuide/security-iam-awsmanpol.html#security-iam-awsmanpol-IAMCreateRootUserPassword)
    #
    # -
    # [IAMDeleteRootUserCredentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/security-iam-awsmanpol.html#security-iam-awsmanpol-IAMDeleteRootUserCredentials)
    #
    # -
    # [S3UnlockBucketPolicy](https://docs.aws.amazon.com/IAM/latest/UserGuide/security-iam-awsmanpol.html#security-iam-awsmanpol-S3UnlockBucketPolicy)
    #
    # -
    # [SQSUnlockQueuePolicy](https://docs.aws.amazon.com/IAM/latest/UserGuide/security-iam-awsmanpol.html#security-iam-awsmanpol-SQSUnlockQueuePolicy)
    property task_policy_arn : PolicyDescriptorType

    # The duration, in seconds, of the privileged session. The value can range from 0 seconds up to
    # the maximum session duration of 900 seconds (15 minutes). If you specify a value higher than
    # this setting, the operation fails.
    #
    # By default, the value is set to `900` seconds.
    property duration_seconds : Int32 | Nil

    def initialize(
      @target_principal : String,
      @task_policy_arn : PolicyDescriptorType,
      @duration_seconds : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TargetPrincipal", @target_principal}

      params.concat(@task_policy_arn.to_query_params("#{prefix}TaskPolicyArn."))

      if value = @duration_seconds
        params << {"#{prefix}DurationSeconds", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        target_principal: Core::XMLValue.string(node.xpath_node("*[local-name()='TargetPrincipal']")).not_nil!,
        task_policy_arn: node.xpath_node("*[local-name()='TaskPolicyArn']").try { |n| PolicyDescriptorType.from_xml(n) }.not_nil!,
        duration_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='DurationSeconds']")),
      )
    end
  end
end
