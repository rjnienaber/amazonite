private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  class DetectStackDriftInput
    # The name of the stack for which you want to detect drift.
    property stack_name : String

    # The logical names of any resources you want to use as filters.
    property logical_resource_ids : Array(String) | Nil

    def initialize(
      @stack_name : String,
      @logical_resource_ids : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackName", @stack_name}

      (@logical_resource_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}LogicalResourceIds.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")).not_nil!,
        logical_resource_ids: node.xpath_nodes("*[local-name()='LogicalResourceIds']/*[local-name()='member']").map { |n| n.content },
      )
    end

    def validate! : Nil
      if value = @stack_name
        raise Core::ValidationError.new("StackName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StackName does not match the required pattern") unless value.matches?(Regex.new("^([a-zA-Z][-a-zA-Z0-9]*)|(arn:\\b(aws|aws-us-gov|aws-cn)\\b:[-a-zA-Z0-9:/._+]*)$"))
      end

      if value = @logical_resource_ids
        raise Core::ValidationError.new("LogicalResourceIds must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("LogicalResourceIds must have at most 200 item(s)") if value.size > 200
      end
    end

    def_equals_and_hash(@stack_name, @logical_resource_ids)
  end
end
