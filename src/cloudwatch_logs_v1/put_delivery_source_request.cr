module Amazonite::CloudWatchLogsV1
  class PutDeliverySourceRequest
    include JSON::Serializable

    # A name for this delivery source. This name must be unique for all delivery sources in your
    # account.
    @[JSON::Field(key: "name")]
    property name : String

    # The ARN of the Amazon Web Services resource that is generating and sending logs. For example,
    # `arn:aws:workmail:us-east-1:123456789012:organization/m-1234EXAMPLEabcd1234abcd1234abcd1234`
    #
    # For the `SECURITY_FINDING_LOGS` logType, use a wildcard ARN for the hub resource. For Amazon Web
    # Services Security Hub CSPM, use `arn:aws:securityhub:us-east-1:111122223333:hub/*` and for
    # Amazon Web Services Security Hub, use `arn:aws:securityhub:us-east-1:111122223333:hubv2/*`
    @[JSON::Field(key: "resourceArn")]
    property resource_arn : String

    # Defines the type of log that the source is sending.
    #
    # - For Application Load Balancer, the valid values are `ALB_ACCESS_LOGS`, `ALB_CONNECTION_LOGS`,
    # and `ALB_HEALTH_CHECK_LOGS`.
    #
    # - For Amazon Bedrock Agents, the valid values are `APPLICATION_LOGS` and `EVENT_LOGS`.
    #
    # - For Amazon Bedrock Knowledge Bases, the valid values are `APPLICATION_LOGS` and `TRACES`.
    #
    # - For Amazon Bedrock AgentCore Runtime, the valid values are `APPLICATION_LOGS`, `USAGE_LOGS`
    # and `TRACES`.
    #
    # - For Amazon Bedrock AgentCore Tools, the valid values are `APPLICATION_LOGS`, `USAGE_LOGS` and
    # `TRACES`.
    #
    # - For Amazon Bedrock AgentCore Identity, the valid values are `APPLICATION_LOGS` and `TRACES`.
    #
    # - For Amazon Bedrock AgentCore Memory, the valid values are `APPLICATION_LOGS` and `TRACES`.
    #
    # - For Amazon Bedrock AgentCore Gateway, the valid values are `APPLICATION_LOGS` and `TRACES`.
    #
    # - For Amazon Bedrock AgentCore Payments, the valid values are `APPLICATION_LOGS` and `TRACES`.
    #
    # - For CloudFront, the valid value is `ACCESS_LOGS`.
    #
    # - For DevOps Agent, the valid value is `APPLICATION_LOGS`.
    #
    # - For Amazon CodeWhisperer, the valid value is `EVENT_LOGS`.
    #
    # - For Elemental MediaPackage, the valid values are `EGRESS_ACCESS_LOGS` and
    # `INGRESS_ACCESS_LOGS`.
    #
    # - For Elemental MediaTailor, the valid values are `AD_DECISION_SERVER_LOGS`,
    # `MANIFEST_SERVICE_LOGS`, and `TRANSCODE_LOGS`.
    #
    # - For Amazon EKS Auto Mode, the valid values are `AUTO_MODE_BLOCK_STORAGE_LOGS`,
    # `AUTO_MODE_COMPUTE_LOGS`, `AUTO_MODE_IPAM_LOGS`, and `AUTO_MODE_LOAD_BALANCING_LOGS`.
    #
    # - For Amazon EKS Capability Logs, the valid values are `EKS_CAPABILITY_ACK_LOGS`,
    # `EKS_CAPABILITY_ARGOCD_APPLICATION_LOGS`, `EKS_CAPABILITY_ARGOCD_APPLICATIONSET_LOGS`,
    # `EKS_CAPABILITY_ARGOCD_COMMITSERVER_LOGS`, `EKS_CAPABILITY_ARGOCD_REPOSERVER_LOGS`,
    # `EKS_CAPABILITY_ARGOCD_SERVER_LOGS`, and `EKS_CAPABILITY_KRO_LOGS`.
    #
    # - For Entity Resolution, the valid value is `WORKFLOW_LOGS`.
    #
    # - For IAM Identity Center, the valid value is `ERROR_LOGS`.
    #
    # - For Network Firewall Proxy, the valid values are `ALERT_LOGS`, `ALLOW_LOGS`, and `DENY_LOGS`.
    #
    # - For Network Load Balancer, the valid value is `NLB_ACCESS_LOGS`.
    #
    # - For PCS, the valid values are `PCS_SCHEDULER_LOGS`, `PCS_JOBCOMP_LOGS`, and
    # `PCS_SCHEDULER_AUDIT_LOGS`.
    #
    # - For Quick, the valid values are `AGENT_HOURS_LOGS`, `CHAT_LOGS`, `FEEDBACK_LOGS`, and
    # `INDEX_USAGE_LOGS`.
    #
    # - For Amazon Web Services RTB Fabric, the valid values is `APPLICATION_LOGS`.
    #
    # - For Amazon Q, the valid values are `EVENT_LOGS` and `SYNC_JOB_LOGS`.
    #
    # - For Amazon S3, the valid value is `S3_SERVER_ACCESS_LOGS`.
    #
    # - For Amazon Web Services Security Hub CSPM, the valid value is `SECURITY_FINDING_LOGS`.
    #
    # - For Amazon Web Services Security Hub, the valid value is `SECURITY_FINDING_LOGS`.
    #
    # - For Amazon SES mail manager, the valid values are `APPLICATION_LOGS` and
    # `TRAFFIC_POLICY_DEBUG_LOGS`.
    #
    # - For Amazon WorkMail, the valid values are `ACCESS_CONTROL_LOGS`, `AUTHENTICATION_LOGS`,
    # `WORKMAIL_AVAILABILITY_PROVIDER_LOGS`, `WORKMAIL_MAILBOX_ACCESS_LOGS`, and
    # `WORKMAIL_PERSONAL_ACCESS_TOKEN_LOGS`.
    #
    # - For Amazon VPC Route Server, the valid value is `EVENT_LOGS`.
    @[JSON::Field(key: "logType")]
    property log_type : String

    # An optional list of key-value pairs to associate with the resource.
    #
    # For more information about tagging, see [Tagging Amazon Web Services
    # resources](https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html)
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    # A map of key-value pairs to configure the delivery source. Both keys and values must be between
    # 1 and 255 characters in length. For example, `{"samplingRate": "50"}`.
    @[JSON::Field(key: "deliverySourceConfiguration")]
    property delivery_source_configuration : Hash(String, String) | Nil

    def initialize(
      @name : String,
      @resource_arn : String,
      @log_type : String,
      @tags : Hash(String, String) | Nil = nil,
      @delivery_source_configuration : Hash(String, String) | Nil = nil,
    )
    end
  end
end
