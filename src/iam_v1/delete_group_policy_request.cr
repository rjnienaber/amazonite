private alias Core = Amazonite::Core

module Amazonite::IamV1
  class DeleteGroupPolicyRequest
    property group_name : String

    property policy_name : String

    def initialize(
      @group_name : String,
      @policy_name : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}GroupName", @group_name}

      params << {"#{prefix}PolicyName", @policy_name}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupName']")).not_nil!,
        policy_name: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyName']")).not_nil!,
      )
    end
  end
end
