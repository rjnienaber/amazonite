private alias Core = Amazonite::Core

module Amazonite::SnsV1
  # Input for SetSubscriptionAttributes action.
  class SetSubscriptionAttributesInput
    # The ARN of the subscription to modify.
    property subscription_arn : String

    # A map of attributes with their corresponding values.
    #
    # The following lists the names, descriptions, and values of the special request parameters that
    # this action uses:
    #
    # - `DeliveryPolicy` – The policy that defines how Amazon SNS retries failed deliveries to HTTP/S
    # endpoints.
    #
    # - `FilterPolicy` – The simple JSON object that lets your subscriber receive only a subset of
    # messages, rather than receiving every message published to the topic.
    #
    # - `FilterPolicyScope` – This attribute lets you choose the filtering scope by using one of the
    # following string value types:
    #
    # - `MessageAttributes` (default) – The filter is applied on the message attributes.
    #
    # - `MessageBody` – The filter is applied on the message body.
    #
    # - `RawMessageDelivery` – When set to `true`, enables raw message delivery to Amazon SQS or
    # HTTP/S endpoints. This eliminates the need for the endpoints to process JSON formatting, which
    # is otherwise created for Amazon SNS metadata.
    #
    # - `RedrivePolicy` – When specified, sends undeliverable messages to the specified Amazon SQS
    # dead-letter queue. Messages that can't be delivered due to client errors (for example, when the
    # subscribed endpoint is unreachable) or server errors (for example, when the service that powers
    # the subscribed endpoint becomes unavailable) are held in the dead-letter queue for further
    # analysis or reprocessing.
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
    property attribute_name : String

    # The new value for the attribute in JSON format.
    property attribute_value : String | Nil

    def initialize(
      @subscription_arn : String,
      @attribute_name : String,
      @attribute_value : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}SubscriptionArn", @subscription_arn}

      params << {"#{prefix}AttributeName", @attribute_name}

      if value = @attribute_value
        params << {"#{prefix}AttributeValue", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        subscription_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='SubscriptionArn']")).not_nil!,
        attribute_name: Core::XMLValue.string(node.xpath_node("*[local-name()='AttributeName']")).not_nil!,
        attribute_value: Core::XMLValue.string(node.xpath_node("*[local-name()='AttributeValue']")),
      )
    end
  end
end
