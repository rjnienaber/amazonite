private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeChangeSetHooksOutput
    property change_set_id : String | Nil

    property change_set_name : String | Nil

    property hooks : Array(ChangeSetHook) | Nil

    property status : ChangeSetHooksStatus | Nil

    property next_token : String | Nil

    property stack_id : String | Nil

    property stack_name : String | Nil

    def initialize(
      @change_set_id : String | Nil = nil,
      @change_set_name : String | Nil = nil,
      @hooks : Array(ChangeSetHook) | Nil = nil,
      @status : ChangeSetHooksStatus | Nil = nil,
      @next_token : String | Nil = nil,
      @stack_id : String | Nil = nil,
      @stack_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @change_set_id
        params << {"#{prefix}ChangeSetId", value}
      end

      if value = @change_set_name
        params << {"#{prefix}ChangeSetName", value}
      end

      (@hooks || [] of ChangeSetHook).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Hooks.member.#{i}."))
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @stack_id
        params << {"#{prefix}StackId", value}
      end

      if value = @stack_name
        params << {"#{prefix}StackName", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        change_set_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ChangeSetId']")),
        change_set_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ChangeSetName']")),
        hooks: node.xpath_nodes("*[local-name()='Hooks']/*[local-name()='member']").map { |n| ChangeSetHook.from_xml(n) },
        status: (n = node.xpath_node("*[local-name()='Status']")) ? ACF::ChangeSetHooksStatus.from_json_object_key?(n.content) : nil,
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        stack_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackId']")),
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")),
      )
    end
  end
end
