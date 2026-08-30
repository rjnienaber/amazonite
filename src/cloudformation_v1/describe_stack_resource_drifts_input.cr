private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeStackResourceDriftsInput
    # The name of the stack for which you want drift information.
    property stack_name : String

    # The resource drift status values to use as filters for the resource drift results returned.
    #
    # - `DELETED`: The resource differs from its expected template configuration in that the resource
    # has been deleted.
    #
    # - `MODIFIED`: One or more resource properties differ from their expected template values.
    #
    # - `IN_SYNC`: The resource's actual configuration matches its expected template configuration.
    #
    # - `NOT_CHECKED`: CloudFormation doesn't currently return this value.
    #
    # - `UNKNOWN`: CloudFormation could not run drift detection for the resource.
    property stack_resource_drift_status_filters : Array(StackResourceDriftStatus) | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    property next_token : String | Nil

    # The maximum number of results to be returned with a single call. If the number of available
    # results exceeds this maximum, the response includes a `NextToken` value that you can assign to
    # the `NextToken` request parameter to get the next set of results.
    property max_results : Int32 | Nil

    def initialize(
      @stack_name : String,
      @stack_resource_drift_status_filters : Array(StackResourceDriftStatus) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackName", @stack_name}

      (@stack_resource_drift_status_filters || [] of StackResourceDriftStatus).each_with_index(1) do |item, i|
        params << {"#{prefix}StackResourceDriftStatusFilters.member.#{i}", item.to_json_object_key}
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
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")).not_nil!,
        stack_resource_drift_status_filters: node.xpath_nodes("*[local-name()='StackResourceDriftStatusFilters']/*[local-name()='member']").compact_map { |n| ACF::StackResourceDriftStatus.from_json_object_key?(n.content) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
      )
    end
  end
end
