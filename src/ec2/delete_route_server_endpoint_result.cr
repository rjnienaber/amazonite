private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteRouteServerEndpointResult
    # Information about the deleted route server endpoint.
    property route_server_endpoint : RouteServerEndpoint | Nil

    def initialize(
      @route_server_endpoint : RouteServerEndpoint | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @route_server_endpoint
        params.concat(value.to_query_params("#{prefix}RouteServerEndpoint."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        route_server_endpoint: node.xpath_node("*[local-name()='routeServerEndpoint']").try { |n| RouteServerEndpoint.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @route_server_endpoint
        value.validate!
      end
    end

    def_equals_and_hash(@route_server_endpoint)
  end
end
