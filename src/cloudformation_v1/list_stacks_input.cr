private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The input for ListStacks action.
  class ListStacksInput
    # The token for the next set of items to return. (You received this token from a previous call.)
    property next_token : String | Nil

    # Stack status to use as a filter. Specify one or more stack status codes to list only stacks with
    # the specified status codes. For a complete list of stack status codes, see the `StackStatus`
    # parameter of the Stack data type.
    property stack_status_filter : Array(StackStatus) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @stack_status_filter : Array(StackStatus) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@stack_status_filter || [] of StackStatus).each_with_index(1) do |item, i|
        params << {"#{prefix}StackStatusFilter.member.#{i}", item.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        stack_status_filter: node.xpath_nodes("*[local-name()='StackStatusFilter']/*[local-name()='member']").compact_map { |n| ACF::StackStatus.from_json_object_key?(n.content) },
      )
    end

    def_equals_and_hash(@next_token, @stack_status_filter)
  end
end
