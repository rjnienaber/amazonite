private alias Core = Amazonite::Core

module Amazonite::StsV1
  # You can pass custom key-value pair attributes when you assume a role or federate a user. These
  # are called session tags. You can then use the session tags to control access to resources. For
  # more information, see [Tagging Amazon Web Services STS
  # Sessions](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html) in the *IAM
  # User Guide*.
  class Tag
    # The key for a session tag.
    #
    # You can pass up to 50 session tags. The plain text session tag keys can’t exceed 128 characters.
    # For these and additional limits, see [IAM and STS Character
    # Limits](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-limits.html#reference_iam-limits-entity-length)
    # in the *IAM User Guide*.
    property key : String

    # The value for a session tag.
    #
    # You can pass up to 50 session tags. The plain text session tag values can’t exceed 256
    # characters. For these and additional limits, see [IAM and STS Character
    # Limits](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-limits.html#reference_iam-limits-entity-length)
    # in the *IAM User Guide*.
    property value : String

    def initialize(
      @key : String,
      @value : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Key", @key}

      params << {"#{prefix}Value", @value}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        key: Core::XMLValue.string(node.xpath_node("*[local-name()='Key']")).not_nil!,
        value: Core::XMLValue.string(node.xpath_node("*[local-name()='Value']")).not_nil!,
      )
    end
  end
end
