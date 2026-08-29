private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetContextKeysForPrincipalPolicyRequest
    property policy_source_arn : String

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
  end
end
