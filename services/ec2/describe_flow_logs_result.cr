private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeFlowLogsResult
    # Information about the flow logs.
    property flow_logs : Array(FlowLog) | Nil

    # The token to request the next page of items. This value is `null` when there are no more items
    # to return.
    property next_token : String | Nil

    def initialize(
      @flow_logs : Array(FlowLog) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@flow_logs || [] of FlowLog).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}FlowLogSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        flow_logs: node.xpath_nodes("*[local-name()='flowLogSet']/*[local-name()='item']").map { |n| FlowLog.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @flow_logs
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@flow_logs, @next_token)
  end
end
