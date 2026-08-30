private alias Core = Amazonite::Core

module Amazonite::SnsV1
  # Input for SetTopicAttributes action.
  class SetTopicAttributesInput
    # The ARN of the topic to modify.
    property topic_arn : String

    # A map of attributes with their corresponding values.
    #
    # The following lists the names, descriptions, and values of the special request parameters that
    # the `SetTopicAttributes` action uses:
    #
    # - `DeliveryPolicy` – The policy that defines how Amazon SNS retries failed deliveries to HTTP/S
    # endpoints.
    #
    # - `DisplayName` – The display name to use for a topic with SMS subscriptions.
    #
    # - `Policy` – The policy that defines who can access your topic. By default, only the topic owner
    # can publish or subscribe to the topic.
    #
    # - `TracingConfig` – Tracing mode of an Amazon SNS topic. By default `TracingConfig` is set to
    # `PassThrough`, and the topic passes through the tracing header it receives from an Amazon SNS
    # publisher to its subscriptions. If set to `Active`, Amazon SNS will vend X-Ray segment data to
    # topic owner account if the sampled flag in the tracing header is true. This is only supported on
    # standard topics.
    #
    # - HTTP
    #
    # - `HTTPSuccessFeedbackRoleArn` – Indicates successful message delivery status for an Amazon SNS
    # topic that is subscribed to an HTTP endpoint.
    #
    # - `HTTPSuccessFeedbackSampleRate` – Indicates percentage of successful messages to sample for an
    # Amazon SNS topic that is subscribed to an HTTP endpoint.
    #
    # - `HTTPFailureFeedbackRoleArn` – Indicates failed message delivery status for an Amazon SNS
    # topic that is subscribed to an HTTP endpoint.
    #
    # - Amazon Data Firehose
    #
    # - `FirehoseSuccessFeedbackRoleArn` – Indicates successful message delivery status for an Amazon
    # SNS topic that is subscribed to an Amazon Data Firehose endpoint.
    #
    # - `FirehoseSuccessFeedbackSampleRate` – Indicates percentage of successful messages to sample
    # for an Amazon SNS topic that is subscribed to an Amazon Data Firehose endpoint.
    #
    # - `FirehoseFailureFeedbackRoleArn` – Indicates failed message delivery status for an Amazon SNS
    # topic that is subscribed to an Amazon Data Firehose endpoint.
    #
    # - Lambda
    #
    # - `LambdaSuccessFeedbackRoleArn` – Indicates successful message delivery status for an Amazon
    # SNS topic that is subscribed to an Lambda endpoint.
    #
    # - `LambdaSuccessFeedbackSampleRate` – Indicates percentage of successful messages to sample for
    # an Amazon SNS topic that is subscribed to an Lambda endpoint.
    #
    # - `LambdaFailureFeedbackRoleArn` – Indicates failed message delivery status for an Amazon SNS
    # topic that is subscribed to an Lambda endpoint.
    #
    # - Platform application endpoint
    #
    # - `ApplicationSuccessFeedbackRoleArn` – Indicates successful message delivery status for an
    # Amazon SNS topic that is subscribed to an platform application endpoint.
    #
    # - `ApplicationSuccessFeedbackSampleRate` – Indicates percentage of successful messages to sample
    # for an Amazon SNS topic that is subscribed to an platform application endpoint.
    #
    # - `ApplicationFailureFeedbackRoleArn` – Indicates failed message delivery status for an Amazon
    # SNS topic that is subscribed to an platform application endpoint.
    #
    # In addition to being able to configure topic attributes for message delivery status of
    # notification messages sent to Amazon SNS application endpoints, you can also configure
    # application attributes for the delivery status of push notification messages sent to push
    # notification services.
    #
    # For example, For more information, see [Using Amazon SNS Application Attributes for Message
    # Delivery Status](https://docs.aws.amazon.com/sns/latest/dg/sns-msg-status.html).
    #
    # - Amazon SQS
    #
    # - `SQSSuccessFeedbackRoleArn` – Indicates successful message delivery status for an Amazon SNS
    # topic that is subscribed to an Amazon SQS endpoint.
    #
    # - `SQSSuccessFeedbackSampleRate` – Indicates percentage of successful messages to sample for an
    # Amazon SNS topic that is subscribed to an Amazon SQS endpoint.
    #
    # - `SQSFailureFeedbackRoleArn` – Indicates failed message delivery status for an Amazon SNS topic
    # that is subscribed to an Amazon SQS endpoint.
    #
    # The SuccessFeedbackRoleArn and FailureFeedbackRoleArn attributes are used to give Amazon SNS
    # write access to use CloudWatch Logs on your behalf. The SuccessFeedbackSampleRate attribute is
    # for specifying the sample rate percentage (0-100) of successfully delivered messages. After you
    # configure the FailureFeedbackRoleArn attribute, then all failed message deliveries generate
    # CloudWatch Logs.
    #
    # The following attribute applies only to
    # [server-side-encryption](https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html):
    #
    # - `KmsMasterKeyId` – The ID of an Amazon Web Services managed customer master key (CMK) for
    # Amazon SNS or a custom CMK. For more information, see [Key
    # Terms](https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html#sse-key-terms).
    # For more examples, see
    # [KeyId](https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestParameters)
    # in the *Key Management Service API Reference*.
    #
    # - `SignatureVersion` – The signature version corresponds to the hashing algorithm used while
    # creating the signature of the notifications, subscription confirmations, or unsubscribe
    # confirmation messages sent by Amazon SNS. By default, `SignatureVersion` is set to `1`.
    #
    # The following attribute applies only to [FIFO
    # topics](https://docs.aws.amazon.com/sns/latest/dg/sns-fifo-topics.html):
    #
    # - `ArchivePolicy` – The policy that sets the retention period for messages stored in the message
    # archive of an Amazon SNS FIFO topic.
    #
    # - `ContentBasedDeduplication` – Enables content-based deduplication for FIFO topics.
    #
    # - By default, `ContentBasedDeduplication` is set to `false`. If you create a FIFO topic and this
    # attribute is `false`, you must specify a value for the `MessageDeduplicationId` parameter for
    # the [Publish](https://docs.aws.amazon.com/sns/latest/api/API_Publish.html) action.
    #
    # - When you set `ContentBasedDeduplication` to `true`, Amazon SNS uses a SHA-256 hash to generate
    # the `MessageDeduplicationId` using the body of the message (but not the attributes of the
    # message).
    #
    # (Optional) To override the generated value, you can specify a value for the
    # `MessageDeduplicationId` parameter for the `Publish` action.
    #
    # - `FifoThroughputScope` – Enables higher throughput for your FIFO topic by adjusting the scope
    # of deduplication. This attribute has two possible values:
    #
    # - `Topic` – The scope of message deduplication is across the entire topic. This is the default
    # value and maintains existing behavior, with a maximum throughput of 3000 messages per second or
    # 20MB per second, whichever comes first.
    #
    # - `MessageGroup` – The scope of deduplication is within each individual message group, which
    # enables higher throughput per topic subject to regional quotas. For more information on quotas
    # or to request an increase, see [Amazon SNS service
    # quotas](https://docs.aws.amazon.com/general/latest/gr/sns.html) in the Amazon Web Services
    # General Reference.
    property attribute_name : String

    # The new value for the attribute.
    property attribute_value : String | Nil

    def initialize(
      @topic_arn : String,
      @attribute_name : String,
      @attribute_value : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TopicArn", @topic_arn}

      params << {"#{prefix}AttributeName", @attribute_name}

      if value = @attribute_value
        params << {"#{prefix}AttributeValue", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        topic_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TopicArn']")).not_nil!,
        attribute_name: Core::XMLValue.string(node.xpath_node("*[local-name()='AttributeName']")).not_nil!,
        attribute_value: Core::XMLValue.string(node.xpath_node("*[local-name()='AttributeValue']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@topic_arn, @attribute_name, @attribute_value)
  end
end
