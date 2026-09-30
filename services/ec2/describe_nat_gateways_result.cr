private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeNatGatewaysResult
    # Information about the NAT gateways.
    property nat_gateways : Array(NatGateway) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @nat_gateways : Array(NatGateway) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@nat_gateways || [] of NatGateway).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}NatGatewaySet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        nat_gateways: node.xpath_nodes("*[local-name()='natGatewaySet']/*[local-name()='item']").map { |n| NatGateway.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @nat_gateways
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@nat_gateways, @next_token)
  end
end
