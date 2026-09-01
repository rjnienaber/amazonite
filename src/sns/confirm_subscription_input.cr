private alias Core = Amazonite::Core

module Amazonite::Sns
  # Input for ConfirmSubscription action.
  class ConfirmSubscriptionInput
    # The ARN of the topic for which you wish to confirm a subscription.
    property topic_arn : String

    # Short-lived token sent to an endpoint during the `Subscribe` action.
    property token : String

    # Disallows unauthenticated unsubscribes of the subscription. If the value of this parameter is
    # `true` and the request has an Amazon Web Services signature, then only the topic owner and the
    # subscription owner can unsubscribe the endpoint. The unsubscribe action requires Amazon Web
    # Services authentication.
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

    def validate! : Nil
    end

    def_equals_and_hash(@topic_arn, @token, @authenticate_on_unsubscribe)
  end
end
