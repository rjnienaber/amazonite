private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeStackInstanceInput
    property stack_set_name : String

    property stack_instance_account : String

    property stack_instance_region : String

    property call_as : CallAs | Nil

    def initialize(
      @stack_set_name : String,
      @stack_instance_account : String,
      @stack_instance_region : String,
      @call_as : CallAs | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackSetName", @stack_set_name}

      params << {"#{prefix}StackInstanceAccount", @stack_instance_account}

      params << {"#{prefix}StackInstanceRegion", @stack_instance_region}

      if value = @call_as
        params << {"#{prefix}CallAs", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_set_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackSetName']")).not_nil!,
        stack_instance_account: Core::XMLValue.string(node.xpath_node("*[local-name()='StackInstanceAccount']")).not_nil!,
        stack_instance_region: Core::XMLValue.string(node.xpath_node("*[local-name()='StackInstanceRegion']")).not_nil!,
        call_as: (n = node.xpath_node("*[local-name()='CallAs']")) ? ACF::CallAs.from_json_object_key?(n.content) : nil,
      )
    end
  end
end
