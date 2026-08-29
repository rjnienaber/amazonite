private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class SetStackPolicyInput
    property stack_name : String

    property stack_policy_body : String | Nil

    property stack_policy_url : String | Nil

    def initialize(
      @stack_name : String,
      @stack_policy_body : String | Nil = nil,
      @stack_policy_url : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackName", @stack_name}

      if value = @stack_policy_body
        params << {"#{prefix}StackPolicyBody", value}
      end

      if value = @stack_policy_url
        params << {"#{prefix}StackPolicyURL", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")).not_nil!,
        stack_policy_body: Core::XMLValue.string(node.xpath_node("*[local-name()='StackPolicyBody']")),
        stack_policy_url: Core::XMLValue.string(node.xpath_node("*[local-name()='StackPolicyURL']")),
      )
    end
  end
end
