private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeEventsOutput
    # A list of operation events that match the specified criteria.
    property operation_events : Array(OperationEvent) | Nil

    # If the request doesn't return all the remaining results, `NextToken` is set to a token. To
    # retrieve the next set of results, call `DescribeEvents` again and assign that token to the
    # request object's `NextToken` parameter. If the request returns all results, `NextToken` is set
    # to `null`.
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

    def validate! : Nil
      if value = @operation_events
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@operation_events, @next_token)
  end
end
