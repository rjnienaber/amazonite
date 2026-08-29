private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class RemovePermissionInput
    property topic_arn : String

    property label : String

    def initialize(
      @topic_arn : String,
      @label : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TopicArn", @topic_arn}

      params << {"#{prefix}Label", @label}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        topic_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TopicArn']")).not_nil!,
        label: Core::XMLValue.string(node.xpath_node("*[local-name()='Label']")).not_nil!,
      )
    end
  end
end
