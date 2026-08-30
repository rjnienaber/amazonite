private alias Core = Amazonite::Core

module Amazonite::IamV1
  class PutRolePolicyRequest
    # The name of the role to associate the policy with.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property role_name : String

    # The name of the policy document.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property policy_name : String

    # The policy document.
    #
    # You must provide policies in JSON format in IAM. However, for CloudFormation templates formatted
    # in YAML, you can provide the policy in JSON or YAML format. CloudFormation always converts a
    # YAML policy to JSON format before submitting it to IAM.
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

    def initialize(
      @role_name : String,
      @policy_name : String,
      @policy_document : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}RoleName", @role_name}

      params << {"#{prefix}PolicyName", @policy_name}

      params << {"#{prefix}PolicyDocument", @policy_document}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        role_name: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleName']")).not_nil!,
        policy_name: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyName']")).not_nil!,
        policy_document: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyDocument']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @role_name
        raise Core::ValidationError.new("RoleName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RoleName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("RoleName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @policy_name
        raise Core::ValidationError.new("PolicyName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PolicyName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("PolicyName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @policy_document
        raise Core::ValidationError.new("PolicyDocument length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PolicyDocument length must be <= 131072") if value.size > 131072
        raise Core::ValidationError.new("PolicyDocument does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -ÿ]+$"))
      end
    end

    def_equals_and_hash(@role_name, @policy_name, @policy_document)
  end
end
