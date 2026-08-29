private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DeleteChangeSetInput
    property change_set_name : String

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
  end
end
