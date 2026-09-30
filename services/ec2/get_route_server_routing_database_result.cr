private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetRouteServerRoutingDatabaseResult
    # Indicates whether routes are being persisted in the routing database.
    property are_routes_persisted : Bool | Nil

    # The collection of routes in the route server's routing database.
    property routes : Array(RouteServerRoute) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @are_routes_persisted : Bool | Nil = nil,
      @routes : Array(RouteServerRoute) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @are_routes_persisted
        params << {"#{prefix}AreRoutesPersisted", Core::QueryValue.bool(value)}
      end

      (@routes || [] of RouteServerRoute).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RouteSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        are_routes_persisted: Core::XMLValue.bool(node.xpath_node("*[local-name()='areRoutesPersisted']")),
        routes: node.xpath_nodes("*[local-name()='routeSet']/*[local-name()='item']").map { |n| RouteServerRoute.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @routes
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@are_routes_persisted, @routes, @next_token)
  end
end
