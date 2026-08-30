private alias Core = Amazonite::Core

module Amazonite::IamV1
  class CreatePolicyRequest
    # The friendly name of the policy.
    #
    # IAM user, group, role, and policy names must be unique within the account. Names are not
    # distinguished by case. For example, you cannot create resources named both "MyResource" and
    # "myresource".
    property policy_name : String

    # The path for the policy.
    #
    # For more information about paths, see [IAM
    # identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html) in the
    # *IAM User Guide*.
    #
    # This parameter is optional. If it is not included, it defaults to a slash (/).
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of either a forward slash (/) by itself or a string that must begin and
    # end with forward slashes. In addition, it can contain any ASCII character from the ! (`\u0021`)
    # through the DEL character (`\u007F`), including most punctuation characters, digits, and upper
    # and lowercased letters.
    #
    # You cannot use an asterisk (*) in the path name.
    property path : String | Nil

    # The JSON policy document that you want to use as the content for the new policy.
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
    # To learn more about JSON policy grammar, see [Grammar of the IAM JSON policy
    # language](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_grammar.html) in
    # the *IAM User Guide*.
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

    # A friendly description of the policy.
    #
    # Typically used to store information about the permissions defined in the policy. For example,
    # "Grants access to production DynamoDB tables."
    #
    # The policy description is immutable. After a value is assigned, it cannot be changed.
    property description : String | Nil

    # A list of tags that you want to attach to the new IAM customer managed policy. Each tag consists
    # of a key name and an associated value. For more information about tagging, see [Tagging IAM
    # resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the *IAM User
    # Guide*.
    #
    # If any one of the tags is invalid or if you exceed the allowed maximum number of tags, then the
    # entire request fails and the resource is not created.
    property tags : Array(Tag) | Nil

    def initialize(
      @policy_name : String,
      @policy_document : String,
      @path : String | Nil = nil,
      @description : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}PolicyName", @policy_name}

      if value = @path
        params << {"#{prefix}Path", value}
      end

      params << {"#{prefix}PolicyDocument", @policy_document}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_name: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyName']")).not_nil!,
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")),
        policy_document: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyDocument']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end

    def_equals_and_hash(@policy_name, @path, @policy_document, @description, @tags)
  end
end
