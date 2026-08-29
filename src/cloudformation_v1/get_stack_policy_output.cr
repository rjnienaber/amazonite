private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class GetStackPolicyOutput
    property stack_policy_body : String | Nil

    def initialize(
      @stack_policy_body : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @stack_policy_body
        params << {"#{prefix}StackPolicyBody", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_policy_body: Core::XMLValue.string(node.xpath_node("*[local-name()='StackPolicyBody']")),
      )
    end
  end
end
