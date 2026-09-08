private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateTransitGatewayMulticastDomainResult
    # Information about the transit gateway multicast domain.
    property transit_gateway_multicast_domain : TransitGatewayMulticastDomain | Nil

    def initialize(
      @transit_gateway_multicast_domain : TransitGatewayMulticastDomain | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_multicast_domain
        params.concat(value.to_query_params("#{prefix}TransitGatewayMulticastDomain."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_multicast_domain: node.xpath_node("*[local-name()='transitGatewayMulticastDomain']").try { |n| TransitGatewayMulticastDomain.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @transit_gateway_multicast_domain
        value.validate!
      end
    end

    def_equals_and_hash(@transit_gateway_multicast_domain)
  end
end
