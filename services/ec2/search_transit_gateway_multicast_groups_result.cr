private alias Core = Amazonite::Core

module Amazonite::EC2
  class SearchTransitGatewayMulticastGroupsResult
    # Information about the transit gateway multicast group.
    property multicast_groups : Array(TransitGatewayMulticastGroup) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @multicast_groups : Array(TransitGatewayMulticastGroup) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@multicast_groups || [] of TransitGatewayMulticastGroup).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}MulticastGroups.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        multicast_groups: node.xpath_nodes("*[local-name()='multicastGroups']/*[local-name()='item']").map { |n| TransitGatewayMulticastGroup.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @multicast_groups
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@multicast_groups, @next_token)
  end
end
