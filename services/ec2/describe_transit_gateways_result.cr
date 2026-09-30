private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeTransitGatewaysResult
    # Information about the transit gateways.
    property transit_gateways : Array(TransitGateway) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @transit_gateways : Array(TransitGateway) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@transit_gateways || [] of TransitGateway).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TransitGatewaySet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateways: node.xpath_nodes("*[local-name()='transitGatewaySet']/*[local-name()='item']").map { |n| TransitGateway.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @transit_gateways
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@transit_gateways, @next_token)
  end
end
