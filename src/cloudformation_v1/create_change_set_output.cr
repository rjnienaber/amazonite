private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The output for the CreateChangeSet action.
  class CreateChangeSetOutput
    # The Amazon Resource Name (ARN) of the change set.
    property id : String | Nil

    # The unique ID of the stack.
    property stack_id : String | Nil

    def initialize(
      @id : String | Nil = nil,
      @stack_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @id
        params << {"#{prefix}Id", value}
      end

      if value = @stack_id
        params << {"#{prefix}StackId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        id: Core::XMLValue.string(node.xpath_node("*[local-name()='Id']")),
        stack_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackId']")),
      )
    end
  end
end
