private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListStackSetOperationResultsInput
    property stack_set_name : String

    property operation_id : String

    property next_token : String | Nil

    property max_results : Int32 | Nil

    property call_as : CallAs | Nil

    property filters : Array(OperationResultFilter) | Nil

    def initialize(
      @stack_set_name : String,
      @operation_id : String,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @call_as : CallAs | Nil = nil,
      @filters : Array(OperationResultFilter) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackSetName", @stack_set_name}

      params << {"#{prefix}OperationId", @operation_id}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @call_as
        params << {"#{prefix}CallAs", value.to_json_object_key}
      end

      (@filters || [] of OperationResultFilter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filters.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_set_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackSetName']")).not_nil!,
        operation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OperationId']")).not_nil!,
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        call_as: (n = node.xpath_node("*[local-name()='CallAs']")) ? ACF::CallAs.from_json_object_key?(n.content) : nil,
        filters: node.xpath_nodes("*[local-name()='Filters']/*[local-name()='member']").map { |n| OperationResultFilter.from_xml(n) },
      )
    end
  end
end
