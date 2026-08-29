private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeStackEventsOutput
    property stack_events : Array(StackEvent) | Nil

    property next_token : String | Nil

    def initialize(
      @stack_events : Array(StackEvent) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@stack_events || [] of StackEvent).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}StackEvents.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_events: node.xpath_nodes("*[local-name()='StackEvents']/*[local-name()='member']").map { |n| StackEvent.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end
  end
end
