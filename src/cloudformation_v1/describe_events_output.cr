private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeEventsOutput
    property operation_events : Array(OperationEvent) | Nil

    property next_token : String | Nil

    def initialize(
      @operation_events : Array(OperationEvent) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@operation_events || [] of OperationEvent).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}OperationEvents.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        operation_events: node.xpath_nodes("*[local-name()='OperationEvents']/*[local-name()='member']").map { |n| OperationEvent.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end
  end
end
