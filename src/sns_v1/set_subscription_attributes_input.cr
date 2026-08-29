private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class SetSubscriptionAttributesInput
    property subscription_arn : String

    property attribute_name : String

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
