private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class DeleteTopicInput
    # The ARN of the topic you want to delete.
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
  end
end
