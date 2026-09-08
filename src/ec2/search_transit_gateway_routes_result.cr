private alias Core = Amazonite::Core

module Amazonite::EC2
  class SearchTransitGatewayRoutesResult
    # Information about the routes.
    property routes : Array(TransitGatewayRoute) | Nil

    # Indicates whether there are additional routes available.
    property additional_routes_available : Bool | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @routes : Array(TransitGatewayRoute) | Nil = nil,
      @additional_routes_available : Bool | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@routes || [] of TransitGatewayRoute).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RouteSet.#{i}."))
      end

      if value = @additional_routes_available
        params << {"#{prefix}AdditionalRoutesAvailable", Core::QueryValue.bool(value)}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        routes: node.xpath_nodes("*[local-name()='routeSet']/*[local-name()='item']").map { |n| TransitGatewayRoute.from_xml(n) },
        additional_routes_available: Core::XMLValue.bool(node.xpath_node("*[local-name()='additionalRoutesAvailable']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @routes
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@routes, @additional_routes_available, @next_token)
  end
end
