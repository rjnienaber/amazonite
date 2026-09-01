private alias Core = Amazonite::Core

module Amazonite::Sns
  # Input for RemovePermission action.
  class RemovePermissionInput
    # The ARN of the topic whose access control policy you wish to modify.
    property topic_arn : String

    # The unique label of the statement you want to remove.
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

    def validate! : Nil
    end

    def_equals_and_hash(@topic_arn, @label)
  end
end
