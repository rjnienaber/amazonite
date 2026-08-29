private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListStackRefactorsInput
    property execution_status_filter : Array(StackRefactorExecutionStatus) | Nil

    property next_token : String | Nil

    property max_results : Int32 | Nil

    def initialize(
      @execution_status_filter : Array(StackRefactorExecutionStatus) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@execution_status_filter || [] of StackRefactorExecutionStatus).each_with_index(1) do |item, i|
        params << {"#{prefix}ExecutionStatusFilter.member.#{i}", item.to_json_object_key}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        execution_status_filter: node.xpath_nodes("*[local-name()='ExecutionStatusFilter']/*[local-name()='member']").compact_map { |n| ACF::StackRefactorExecutionStatus.from_json_object_key?(n.content) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
      )
    end
  end
end
