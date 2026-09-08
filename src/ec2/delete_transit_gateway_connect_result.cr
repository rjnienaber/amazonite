private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteTransitGatewayConnectResult
    # Information about the deleted Connect attachment.
    property transit_gateway_connect : TransitGatewayConnect | Nil

    def initialize(
      @transit_gateway_connect : TransitGatewayConnect | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_connect
        params.concat(value.to_query_params("#{prefix}TransitGatewayConnect."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_connect: node.xpath_node("*[local-name()='transitGatewayConnect']").try { |n| TransitGatewayConnect.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @transit_gateway_connect
        value.validate!
      end
    end

    def_equals_and_hash(@transit_gateway_connect)
  end
end
