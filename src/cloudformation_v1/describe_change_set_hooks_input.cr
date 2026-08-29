private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeChangeSetHooksInput
    property change_set_name : String

    property stack_name : String | Nil

    property next_token : String | Nil

    property logical_resource_id : String | Nil

    def initialize(
      @change_set_name : String,
      @stack_name : String | Nil = nil,
      @next_token : String | Nil = nil,
      @logical_resource_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ChangeSetName", @change_set_name}

      if value = @stack_name
        params << {"#{prefix}StackName", value}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @logical_resource_id
        params << {"#{prefix}LogicalResourceId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        change_set_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ChangeSetName']")).not_nil!,
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        logical_resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LogicalResourceId']")),
      )
    end
  end
end
