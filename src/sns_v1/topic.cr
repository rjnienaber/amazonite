private alias Core = Amazonite::Core

module Amazonite::SnsV1
  # A wrapper type for the topic's Amazon Resource Name (ARN). To retrieve a topic's attributes, use
  # `GetTopicAttributes`.
  class Topic
    # The topic's ARN.
    property topic_arn : String | Nil

    def initialize(
      @topic_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @topic_arn
        params << {"#{prefix}TopicArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        topic_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TopicArn']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@topic_arn)
  end
end
