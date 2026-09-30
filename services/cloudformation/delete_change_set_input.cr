private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # The input for the DeleteChangeSet action.
  class DeleteChangeSetInput
    # The name or Amazon Resource Name (ARN) of the change set that you want to delete.
    property change_set_name : String

    # If you specified the name of a change set to delete, specify the stack name or Amazon Resource
    # Name (ARN) that's associated with it.
    property stack_name : String | Nil

    def initialize(
      @change_set_name : String,
      @stack_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ChangeSetName", @change_set_name}

      if value = @stack_name
        params << {"#{prefix}StackName", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        change_set_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ChangeSetName']")).not_nil!,
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")),
      )
    end

    def validate! : Nil
      if value = @change_set_name
        raise Core::ValidationError.new("ChangeSetName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ChangeSetName length must be <= 1600") if value.size > 1600
        raise Core::ValidationError.new("ChangeSetName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z][-a-zA-Z0-9]*|arn:[-a-zA-Z0-9:/]*$"))
      end

      if value = @stack_name
        raise Core::ValidationError.new("StackName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StackName does not match the required pattern") unless value.matches?(Regex.new("^([a-zA-Z][-a-zA-Z0-9]*)|(arn:\\b(aws|aws-us-gov|aws-cn)\\b:[-a-zA-Z0-9:/._+]*)$"))
      end
    end

    def_equals_and_hash(@change_set_name, @stack_name)
  end
end
