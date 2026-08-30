module Amazonite::SnsV1
  # Response for GetTopicAttributes action.
  class GetTopicAttributesResponse
    # A map of the topic's attributes. Attributes in this map include the following:
    #
    # - `DeliveryPolicy` – The JSON serialization of the topic's delivery policy.
    #
    # - `DisplayName` – The human-readable name used in the `From` field for notifications to `email`
    # and `email-json` endpoints.
    #
    # - `EffectiveDeliveryPolicy` – The JSON serialization of the effective delivery policy, taking
    # system defaults into account.
    #
    # - `Owner` – The Amazon Web Services account ID of the topic's owner.
    #
    # - `Policy` – The JSON serialization of the topic's access control policy.
    #
    # - `SignatureVersion` – The signature version corresponds to the hashing algorithm used while
    # creating the signature of the notifications, subscription confirmations, or unsubscribe
    # confirmation messages sent by Amazon SNS.
    #
    # - By default, `SignatureVersion` is set to **1**. The signature is a Base64-encoded
    # **SHA1withRSA** signature.
    #
    # - When you set `SignatureVersion` to **2**. Amazon SNS uses a Base64-encoded **SHA256withRSA**
    # signature.
    #
    # If the API response does not include the `SignatureVersion` attribute, it means that the
    # `SignatureVersion` for the topic has value **1**.
    #
    # - `SubscriptionsConfirmed` – The number of confirmed subscriptions for the topic.
    #
    # - `SubscriptionsDeleted` – The number of deleted subscriptions for the topic.
    #
    # - `SubscriptionsPending` – The number of subscriptions pending confirmation for the topic.
    #
    # - `TopicArn` – The topic's ARN.
    #
    # - `TracingConfig` – Tracing mode of an Amazon SNS topic. By default `TracingConfig` is set to
    # `PassThrough`, and the topic passes through the tracing header it receives from an Amazon SNS
    # publisher to its subscriptions. If set to `Active`, Amazon SNS will vend X-Ray segment data to
    # topic owner account if the sampled flag in the tracing header is true. This is only supported on
    # standard topics.
    #
    # The following attribute applies only to
    # [server-side-encryption](https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html):
    #
    # - `KmsMasterKeyId` - The ID of an Amazon Web Services managed customer master key (CMK) for
    # Amazon SNS or a custom CMK. For more information, see [Key
    # Terms](https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html#sse-key-terms).
    # For more examples, see
    # [KeyId](https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestParameters)
    # in the *Key Management Service API Reference*.
    #
    # The following attributes apply only to [FIFO
    # topics](https://docs.aws.amazon.com/sns/latest/dg/sns-fifo-topics.html):
    #
    # - `ArchivePolicy` – The policy that sets the retention period for messages stored in the message
    # archive of an Amazon SNS FIFO topic.
    #
    # - `BeginningArchiveTime` – The earliest starting point at which a message in the topic’s archive
    # can be replayed from. This point in time is based on the configured message retention period set
    # by the topic’s message archiving policy.
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
    # - `FifoTopic` – When this is set to `true`, a FIFO topic is created.
    property attributes : Hash(String, String) | Nil

    def initialize(
      @attributes : Hash(String, String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@attributes || {} of String => String).each_with_index(1) do |(key, value), i|
        params << {"#{prefix}Attributes.entry.#{i}.key", key}
        params << {"#{prefix}Attributes.entry.#{i}.value", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        attributes: node.xpath_nodes("*[local-name()='Attributes']/*[local-name()='entry']").each_with_object({} of String => String) { |entry, hash| hash[entry.xpath_node("*[local-name()='key']").not_nil!.content] = entry.xpath_node("*[local-name()='value']").not_nil!.content },
      )
    end
  end
end
