private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class GetStackPolicyInput
    property stack_name : String

    def initialize(
      @stack_name : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackName", @stack_name}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")).not_nil!,
      )
    end
  end
end
