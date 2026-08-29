private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class CreateStackSetOutput
    property stack_set_id : String | Nil

    def initialize(
      @stack_set_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @stack_set_id
        params << {"#{prefix}StackSetId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_set_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackSetId']")),
      )
    end
  end
end
