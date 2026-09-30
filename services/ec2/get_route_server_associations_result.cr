private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetRouteServerAssociationsResult
    # Information about the associations for the specified route server.
    property route_server_associations : Array(RouteServerAssociation) | Nil

    def initialize(
      @route_server_associations : Array(RouteServerAssociation) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@route_server_associations || [] of RouteServerAssociation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RouteServerAssociationSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        route_server_associations: node.xpath_nodes("*[local-name()='routeServerAssociationSet']/*[local-name()='item']").map { |n| RouteServerAssociation.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @route_server_associations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@route_server_associations)
  end
end
