private alias Core = Amazonite::Core

module Amazonite::SnsV1
  # Input for GetTopicAttributes action.
  class GetTopicAttributesInput
    # The ARN of the topic whose properties you want to get.
    property topic_arn : String

    def initialize(
      @topic_arn : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TopicArn", @topic_arn}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        topic_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TopicArn']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@topic_arn)
  end
end
