private alias Core = Amazonite::Core

module Amazonite::SnsV1
  # Input for ListSubscriptionsByTopic action.
  class ListSubscriptionsByTopicInput
    # The ARN of the topic for which you wish to find subscriptions.
    property topic_arn : String

    # Token returned by the previous `ListSubscriptionsByTopic` request.
    property next_token : String | Nil

    def initialize(
      @topic_arn : String,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TopicArn", @topic_arn}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        topic_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TopicArn']")).not_nil!,
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@topic_arn, @next_token)
  end
end
