private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteNatGatewayResult
    # The ID of the NAT gateway.
    property nat_gateway_id : String | Nil

    def initialize(
      @nat_gateway_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @nat_gateway_id
        params << {"#{prefix}NatGatewayId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        nat_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='natGatewayId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@nat_gateway_id)
  end
end
