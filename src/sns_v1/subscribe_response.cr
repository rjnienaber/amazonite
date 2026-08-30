private alias Core = Amazonite::Core

module Amazonite::SnsV1
  # Response for Subscribe action.
  class SubscribeResponse
    # The ARN of the subscription if it is confirmed, or the string "pending confirmation" if the
    # subscription requires confirmation. However, if the API request parameter
    # `ReturnSubscriptionArn` is true, then the value is always the subscription ARN, even if the
    # subscription requires confirmation.
    property subscription_arn : String | Nil

    def initialize(
      @subscription_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @subscription_arn
        params << {"#{prefix}SubscriptionArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        subscription_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='SubscriptionArn']")),
      )
    end

    def_equals_and_hash(@subscription_arn)
  end
end
