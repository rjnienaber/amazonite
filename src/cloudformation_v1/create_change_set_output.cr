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

    def validate! : Nil
      if value = @id
        raise Core::ValidationError.new("Id length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Id does not match the required pattern") unless value.matches?(Regex.new("^arn:[-a-zA-Z0-9:/]*$"))
      end
    end

    def_equals_and_hash(@id, @stack_id)
  end
end
