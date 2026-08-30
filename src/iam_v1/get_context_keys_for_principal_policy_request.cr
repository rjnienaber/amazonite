private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetContextKeysForPrincipalPolicyRequest
    # The ARN of a user, group, or role whose policies contain the context keys that you want listed.
    # If you specify a user, the list includes context keys that are found in all policies that are
    # attached to the user. The list also includes all groups that the user is a member of. If you
    # pick a group or a role, then it includes only those context keys that are found in policies
    # attached to that entity. Note that all parameters are shown in unencoded form here for clarity,
    # but must be URL encoded to be included as a part of a real HTML request.
    #
    # For more information about ARNs, see [Amazon Resource Names
    # (ARNs)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) in the
    # *Amazon Web Services General Reference*.
    property policy_source_arn : String

    # An optional list of additional policies for which you want the list of context keys that are
    # referenced.
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
    property policy_input_list : Array(String) | Nil

    def initialize(
      @policy_source_arn : String,
      @policy_input_list : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}PolicySourceArn", @policy_source_arn}

      (@policy_input_list || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}PolicyInputList.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_source_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicySourceArn']")).not_nil!,
        policy_input_list: node.xpath_nodes("*[local-name()='PolicyInputList']/*[local-name()='member']").map { |n| n.content },
      )
    end

    def validate! : Nil
      if value = @policy_source_arn
        raise Core::ValidationError.new("PolicySourceArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("PolicySourceArn length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@policy_source_arn, @policy_input_list)
  end
end
