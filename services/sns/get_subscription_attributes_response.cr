module Amazonite::Sns
  # Response for GetSubscriptionAttributes action.
  class GetSubscriptionAttributesResponse
    # A map of the subscription's attributes. Attributes in this map include the following:
    #
    # - `ConfirmationWasAuthenticated` – `true` if the subscription confirmation request was
    # authenticated.
    #
    # - `DeliveryPolicy` – The JSON serialization of the subscription's delivery policy.
    #
    # - `EffectiveDeliveryPolicy` – The JSON serialization of the effective delivery policy that takes
    # into account the topic delivery policy and account system defaults.
    #
    # - `FilterPolicy` – The filter policy JSON that is assigned to the subscription. For more
    # information, see [Amazon SNS Message
    # Filtering](https://docs.aws.amazon.com/sns/latest/dg/sns-message-filtering.html) in the *Amazon
    # SNS Developer Guide*.
    #
    # - `FilterPolicyScope` – This attribute lets you choose the filtering scope by using one of the
    # following string value types:
    #
    # - `MessageAttributes` (default) – The filter is applied on the message attributes.
    #
    # - `MessageBody` – The filter is applied on the message body.
    #
    # - `Owner` – The Amazon Web Services account ID of the subscription's owner.
    #
    # - `PendingConfirmation` – `true` if the subscription hasn't been confirmed. To confirm a pending
    # subscription, call the `ConfirmSubscription` action with a confirmation token.
    #
    # - `RawMessageDelivery` – `true` if raw message delivery is enabled for the subscription. Raw
    # messages are free of JSON formatting and can be sent to HTTP/S and Amazon SQS endpoints.
    #
    # - `RedrivePolicy` – When specified, sends undeliverable messages to the specified Amazon SQS
    # dead-letter queue. Messages that can't be delivered due to client errors (for example, when the
    # subscribed endpoint is unreachable) or server errors (for example, when the service that powers
    # the subscribed endpoint becomes unavailable) are held in the dead-letter queue for further
    # analysis or reprocessing.
    #
    # - `SubscriptionArn` – The subscription's ARN.
    #
    # - `TopicArn` – The topic ARN that the subscription is associated with.
    #
    # The following attribute applies only to Amazon Data Firehose delivery stream subscriptions:
    #
    # - `SubscriptionRoleArn` – The ARN of the IAM role that has the following:
    #
    # - Permission to write to the Firehose delivery stream
    #
    # - Amazon SNS listed as a trusted entity
    #
    # Specifying a valid ARN for this attribute is required for Firehose delivery stream
    # subscriptions. For more information, see [Fanout to Firehose delivery
    # streams](https://docs.aws.amazon.com/sns/latest/dg/sns-firehose-as-subscriber.html) in the
    # *Amazon SNS Developer Guide*.
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

    def validate! : Nil
    end

    def_equals_and_hash(@attributes)
  end
end
