private alias Core = Amazonite::Core

module Amazonite::Sns
  # Input for GetSubscriptionAttributes.
  class GetSubscriptionAttributesInput
    # The ARN of the subscription whose properties you want to get.
    property subscription_arn : String

    def initialize(
      @subscription_arn : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}SubscriptionArn", @subscription_arn}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        subscription_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='SubscriptionArn']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@subscription_arn)
  end
end
