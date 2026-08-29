private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class ConfirmSubscriptionInput
    property topic_arn : String

    property token : String

    property authenticate_on_unsubscribe : String | Nil

    def initialize(
      @topic_arn : String,
      @token : String,
      @authenticate_on_unsubscribe : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TopicArn", @topic_arn}

      params << {"#{prefix}Token", @token}

      if value = @authenticate_on_unsubscribe
        params << {"#{prefix}AuthenticateOnUnsubscribe", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        topic_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TopicArn']")).not_nil!,
        token: Core::XMLValue.string(node.xpath_node("*[local-name()='Token']")).not_nil!,
        authenticate_on_unsubscribe: Core::XMLValue.string(node.xpath_node("*[local-name()='AuthenticateOnUnsubscribe']")),
      )
    end
  end
end
