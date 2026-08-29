private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class InlinePolicyIdentifierType
    property policy_name : String

    property attachment_type : AttachmentType

    property attachment_name : String

    def initialize(
      @policy_name : String,
      @attachment_type : AttachmentType,
      @attachment_name : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}PolicyName", @policy_name}

      params << {"#{prefix}AttachmentType", @attachment_type.to_json_object_key}

      params << {"#{prefix}AttachmentName", @attachment_name}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_name: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyName']")).not_nil!,
        attachment_type: ((n = node.xpath_node("*[local-name()='AttachmentType']")) ? AI::AttachmentType.from_json_object_key?(n.content) : nil).not_nil!,
        attachment_name: Core::XMLValue.string(node.xpath_node("*[local-name()='AttachmentName']")).not_nil!,
      )
    end
  end
end
