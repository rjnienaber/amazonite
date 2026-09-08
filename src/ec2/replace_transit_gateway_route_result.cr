private alias Core = Amazonite::Core

module Amazonite::EC2
  class ReplaceTransitGatewayRouteResult
    # Information about the modified route.
    property route : TransitGatewayRoute | Nil

    def initialize(
      @route : TransitGatewayRoute | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @route
        params.concat(value.to_query_params("#{prefix}Route."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        route: node.xpath_node("*[local-name()='route']").try { |n| TransitGatewayRoute.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @route
        value.validate!
      end
    end

    def_equals_and_hash(@route)
  end
end
