private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Identifies one or more inline policies that are embedded in IAM users, groups, or roles, by the
  # name of the policy together with the type and name of the entity that it is attached to.
  # Wildcard characters in the entity name can match multiple entities, so a single identifier can
  # select more than one attached inline policy.
  class InlinePolicyIdentifierType
    # The name of the inline policy.
    property policy_name : String

    # The type of IAM entity that the inline policy is attached to.
    property attachment_type : AttachmentType

    # The name of the IAM user, group, or role that the inline policy is attached to. Wildcard
    # characters are supported to match multiple entities: use at most one `*` (matches any sequence
    # of characters, including none), and any number of `?` (each matches exactly one character).
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

    def_equals_and_hash(@policy_name, @attachment_type, @attachment_name)
  end
end
