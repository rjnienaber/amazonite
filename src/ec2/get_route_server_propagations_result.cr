private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetRouteServerPropagationsResult
    # Information about the route propagations for the specified route server.
    property route_server_propagations : Array(RouteServerPropagation) | Nil

    def initialize(
      @route_server_propagations : Array(RouteServerPropagation) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@route_server_propagations || [] of RouteServerPropagation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RouteServerPropagationSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        route_server_propagations: node.xpath_nodes("*[local-name()='routeServerPropagationSet']/*[local-name()='item']").map { |n| RouteServerPropagation.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @route_server_propagations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@route_server_propagations)
  end
end
