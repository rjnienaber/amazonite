private alias Core = Amazonite::Core

module Amazonite::SnsV1
  # A wrapper type for the attributes of an Amazon SNS subscription.
  class Subscription
    # The subscription's ARN.
    property subscription_arn : String | Nil

    # The subscription's owner.
    property owner : String | Nil

    # The subscription's protocol.
    property protocol : String | Nil

    # The subscription's endpoint (format depends on the protocol).
    property endpoint : String | Nil

    # The ARN of the subscription's topic.
    property topic_arn : String | Nil

    def initialize(
      @subscription_arn : String | Nil = nil,
      @owner : String | Nil = nil,
      @protocol : String | Nil = nil,
      @endpoint : String | Nil = nil,
      @topic_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @subscription_arn
        params << {"#{prefix}SubscriptionArn", value}
      end

      if value = @owner
        params << {"#{prefix}Owner", value}
      end

      if value = @protocol
        params << {"#{prefix}Protocol", value}
      end

      if value = @endpoint
        params << {"#{prefix}Endpoint", value}
      end

      if value = @topic_arn
        params << {"#{prefix}TopicArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        subscription_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='SubscriptionArn']")),
        owner: Core::XMLValue.string(node.xpath_node("*[local-name()='Owner']")),
        protocol: Core::XMLValue.string(node.xpath_node("*[local-name()='Protocol']")),
        endpoint: Core::XMLValue.string(node.xpath_node("*[local-name()='Endpoint']")),
        topic_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TopicArn']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@subscription_arn, @owner, @protocol, @endpoint, @topic_arn)
  end
end
