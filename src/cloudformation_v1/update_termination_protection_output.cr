private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class UpdateTerminationProtectionOutput
    # The unique ID of the stack.
    property stack_id : String | Nil

    def initialize(
      @stack_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @stack_id
        params << {"#{prefix}StackId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackId']")),
      )
    end

    def_equals_and_hash(@stack_id)
  end
end
