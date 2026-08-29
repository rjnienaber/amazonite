module Amazonite::IamV1
  class GetContextKeysForCustomPolicyRequest
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
  end
end
