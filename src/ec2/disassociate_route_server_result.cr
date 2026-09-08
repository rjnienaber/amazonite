private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisassociateRouteServerResult
    # Information about the disassociated route server.
    property route_server_association : RouteServerAssociation | Nil

    def initialize(
      @route_server_association : RouteServerAssociation | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @route_server_association
        params.concat(value.to_query_params("#{prefix}RouteServerAssociation."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        route_server_association: node.xpath_node("*[local-name()='routeServerAssociation']").try { |n| RouteServerAssociation.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @route_server_association
        value.validate!
      end
    end

    def_equals_and_hash(@route_server_association)
  end
end
