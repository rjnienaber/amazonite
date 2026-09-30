private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeInstanceEventWindowsResult
    # Information about the event windows.
    property instance_event_windows : Array(InstanceEventWindow) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @instance_event_windows : Array(InstanceEventWindow) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@instance_event_windows || [] of InstanceEventWindow).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}InstanceEventWindowSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_event_windows: node.xpath_nodes("*[local-name()='instanceEventWindowSet']/*[local-name()='item']").map { |n| InstanceEventWindow.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @instance_event_windows
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@instance_event_windows, @next_token)
  end
end
