private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class SubscribeInput
    property topic_arn : String

    property protocol : String

    property endpoint : String | Nil

    property attributes : Hash(String, String) | Nil

    property return_subscription_arn : Bool | Nil

    def initialize(
      @topic_arn : String,
      @protocol : String,
      @endpoint : String | Nil = nil,
      @attributes : Hash(String, String) | Nil = nil,
      @return_subscription_arn : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TopicArn", @topic_arn}

      params << {"#{prefix}Protocol", @protocol}

      if value = @endpoint
        params << {"#{prefix}Endpoint", value}
      end

      (@attributes || {} of String => String).each_with_index(1) do |(key, value), i|
        params << {"#{prefix}Attributes.entry.#{i}.key", key}
        params << {"#{prefix}Attributes.entry.#{i}.value", value}
      end

      if value = @return_subscription_arn
        params << {"#{prefix}ReturnSubscriptionArn", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        topic_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TopicArn']")).not_nil!,
        protocol: Core::XMLValue.string(node.xpath_node("*[local-name()='Protocol']")).not_nil!,
        endpoint: Core::XMLValue.string(node.xpath_node("*[local-name()='Endpoint']")),
        attributes: node.xpath_nodes("*[local-name()='Attributes']/*[local-name()='entry']").each_with_object({} of String => String) { |entry, hash| hash[entry.xpath_node("*[local-name()='key']").not_nil!.content] = entry.xpath_node("*[local-name()='value']").not_nil!.content },
        return_subscription_arn: Core::XMLValue.bool(node.xpath_node("*[local-name()='ReturnSubscriptionArn']")),
      )
    end
  end
end
