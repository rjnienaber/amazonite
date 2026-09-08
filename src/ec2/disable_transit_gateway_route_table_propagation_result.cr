private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisableTransitGatewayRouteTablePropagationResult
    # Information about route propagation.
    property propagation : TransitGatewayPropagation | Nil

    def initialize(
      @propagation : TransitGatewayPropagation | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @propagation
        params.concat(value.to_query_params("#{prefix}Propagation."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        propagation: node.xpath_node("*[local-name()='propagation']").try { |n| TransitGatewayPropagation.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @propagation
        value.validate!
      end
    end

    def_equals_and_hash(@propagation)
  end
end
