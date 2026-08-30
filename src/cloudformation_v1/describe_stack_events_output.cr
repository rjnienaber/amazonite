private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The output for a DescribeStackEvents action.
  class DescribeStackEventsOutput
    # A list of `StackEvents` structures.
    property stack_events : Array(StackEvent) | Nil

    # If the output exceeds 1 MB in size, a string that identifies the next page of events. If no
    # additional page exists, this value is null.
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

    def validate! : Nil
      if value = @stack_events
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@stack_events, @next_token)
  end
end
