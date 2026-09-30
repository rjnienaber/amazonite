private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisassociateNatGatewayAddressResult
    # The ID of the NAT gateway.
    property nat_gateway_id : String | Nil

    # Information about the NAT gateway IP addresses.
    property nat_gateway_addresses : Array(NatGatewayAddress) | Nil

    def initialize(
      @nat_gateway_id : String | Nil = nil,
      @nat_gateway_addresses : Array(NatGatewayAddress) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @nat_gateway_id
        params << {"#{prefix}NatGatewayId", value}
      end

      (@nat_gateway_addresses || [] of NatGatewayAddress).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}NatGatewayAddressSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        nat_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='natGatewayId']")),
        nat_gateway_addresses: node.xpath_nodes("*[local-name()='natGatewayAddressSet']/*[local-name()='item']").map { |n| NatGatewayAddress.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @nat_gateway_addresses
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@nat_gateway_id, @nat_gateway_addresses)
  end
end
