private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisableRouteServerPropagationResult
    # Information about the disabled route server propagation.
    property route_server_propagation : RouteServerPropagation | Nil

    def initialize(
      @route_server_propagation : RouteServerPropagation | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @route_server_propagation
        params.concat(value.to_query_params("#{prefix}RouteServerPropagation."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        route_server_propagation: node.xpath_node("*[local-name()='routeServerPropagation']").try { |n| RouteServerPropagation.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @route_server_propagation
        value.validate!
      end
    end

    def_equals_and_hash(@route_server_propagation)
  end
end
