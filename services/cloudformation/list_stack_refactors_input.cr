private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  class ListStackRefactorsInput
    # Execution status to use as a filter. Specify one or more execution status codes to list only
    # stack refactors with the specified execution status codes.
    property execution_status_filter : Array(StackRefactorExecutionStatus) | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    property next_token : String | Nil

    # The maximum number of results to be returned with a single call. If the number of available
    # results exceeds this maximum, the response includes a `NextToken` value that you can assign to
    # the `NextToken` request parameter to get the next set of results.
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

    def validate! : Nil
      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 1024") if value.size > 1024
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 100") if value > 100
      end
    end

    def_equals_and_hash(@execution_status_filter, @next_token, @max_results)
  end
end
