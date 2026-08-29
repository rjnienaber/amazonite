private alias Core = Amazonite::Core

module Amazonite::IamV1
  class DetachGroupPolicyRequest
    property group_name : String

    property policy_arn : String

    def initialize(
      @group_name : String,
      @policy_arn : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}GroupName", @group_name}

      params << {"#{prefix}PolicyArn", @policy_arn}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupName']")).not_nil!,
        policy_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyArn']")).not_nil!,
      )
    end
  end
end
