private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteTransitGatewayResult
    # Information about the deleted transit gateway.
    property transit_gateway : TransitGateway | Nil

    def initialize(
      @transit_gateway : TransitGateway | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway
        params.concat(value.to_query_params("#{prefix}TransitGateway."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway: node.xpath_node("*[local-name()='transitGateway']").try { |n| TransitGateway.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @transit_gateway
        value.validate!
      end
    end

    def_equals_and_hash(@transit_gateway)
  end
end
