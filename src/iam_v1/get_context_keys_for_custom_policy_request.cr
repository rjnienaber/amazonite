module Amazonite::IamV1
  class GetContextKeysForCustomPolicyRequest
    # A list of policies for which you want the list of context keys referenced in those policies.
    # Each document is specified as a string containing the complete, valid JSON text of an IAM
    # policy.
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
    property policy_input_list : Array(String) = [] of String

    def initialize(
      @policy_input_list : Array(String),
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @policy_input_list.each_with_index(1) do |item, i|
        params << {"#{prefix}PolicyInputList.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_input_list: node.xpath_nodes("*[local-name()='PolicyInputList']/*[local-name()='member']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@policy_input_list)
  end
end
