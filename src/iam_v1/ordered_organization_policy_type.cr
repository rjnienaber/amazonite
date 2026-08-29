module Amazonite::IamV1
  class OrderedOrganizationPolicyType
    property service_control_policy_input_list : Array(String) | Nil

    def initialize(
      @service_control_policy_input_list : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@service_control_policy_input_list || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ServiceControlPolicyInputList.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        service_control_policy_input_list: node.xpath_nodes("*[local-name()='ServiceControlPolicyInputList']/*[local-name()='member']").map { |n| n.content },
      )
    end
  end
end
