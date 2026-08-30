private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The output for the GetStackPolicy action.
  class GetStackPolicyOutput
    # Structure that contains the stack policy body. For more information, see [Prevent updates to
    # stack
    # resources](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/protect-stack-resources.html)
    # in the *CloudFormation User Guide*.
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

    def_equals_and_hash(@stack_policy_body)
  end
end
