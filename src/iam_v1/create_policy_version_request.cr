private alias Core = Amazonite::Core

module Amazonite::IamV1
  class CreatePolicyVersionRequest
    # The Amazon Resource Name (ARN) of the IAM policy to which you want to add a new version.
    #
    # For more information about ARNs, see [Amazon Resource Names
    # (ARNs)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) in the
    # *Amazon Web Services General Reference*.
    property policy_arn : String

    # The JSON policy document that you want to use as the content for this new version of the policy.
    #
    # You must provide policies in JSON format in IAM. However, for CloudFormation templates formatted
    # in YAML, you can provide the policy in JSON or YAML format. CloudFormation always converts a
    # YAML policy to JSON format before submitting it to IAM.
    #
    # The maximum length of the policy document that you can pass in this operation, including
    # whitespace, is listed below. To view the maximum character counts of a managed policy with no
    # whitespaces, see [IAM and STS character
    # quotas](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html#reference_iam-quotas-entity-length).
    #
    # The [regex pattern](http://wikipedia.org/wiki/regex) used to validate this parameter is a string
    # of characters consisting of the following:
    #
    # - Any printable ASCII character ranging from the space character (`\u0020`) through the end of
    # the ASCII character range
    #
    # - The printable characters in the Basic Latin and Latin-1 Supplement character set (through
    # `\u00FF`)
    #
    # - The special characters tab (`\u0009`), line feed (`\u000A`), and carriage return (`\u000D`)
    property policy_document : String

    # Specifies whether to set this version as the policy's default version.
    #
    # When this parameter is `true`, the new policy version becomes the operative version. That is, it
    # becomes the version that is in effect for the IAM users, groups, and roles that the policy is
    # attached to.
    #
    # For more information about managed policy versions, see [Versioning for managed
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html) in
    # the *IAM User Guide*.
    property set_as_default : Bool | Nil

    def initialize(
      @policy_arn : String,
      @policy_document : String,
      @set_as_default : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}PolicyArn", @policy_arn}

      params << {"#{prefix}PolicyDocument", @policy_document}

      if value = @set_as_default
        params << {"#{prefix}SetAsDefault", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyArn']")).not_nil!,
        policy_document: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyDocument']")).not_nil!,
        set_as_default: Core::XMLValue.bool(node.xpath_node("*[local-name()='SetAsDefault']")),
      )
    end

    def validate! : Nil
      if value = @policy_arn
        raise Core::ValidationError.new("PolicyArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("PolicyArn length must be <= 2048") if value.size > 2048
      end

      if value = @policy_document
        raise Core::ValidationError.new("PolicyDocument length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PolicyDocument length must be <= 131072") if value.size > 131072
        raise Core::ValidationError.new("PolicyDocument does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -ÿ]+$"))
      end
    end

    def_equals_and_hash(@policy_arn, @policy_document, @set_as_default)
  end
end
