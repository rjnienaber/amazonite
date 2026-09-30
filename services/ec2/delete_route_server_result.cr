private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteRouteServerResult
    # Information about the deleted route server.
    property route_server : RouteServer | Nil

    def initialize(
      @route_server : RouteServer | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @route_server
        params.concat(value.to_query_params("#{prefix}RouteServer."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        route_server: node.xpath_node("*[local-name()='routeServer']").try { |n| RouteServer.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @route_server
        value.validate!
      end
    end

    def_equals_and_hash(@route_server)
  end
end
