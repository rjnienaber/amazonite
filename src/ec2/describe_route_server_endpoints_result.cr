private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeRouteServerEndpointsResult
    # Information about the described route server endpoints.
    property route_server_endpoints : Array(RouteServerEndpoint) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @route_server_endpoints : Array(RouteServerEndpoint) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@route_server_endpoints || [] of RouteServerEndpoint).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RouteServerEndpointSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        route_server_endpoints: node.xpath_nodes("*[local-name()='routeServerEndpointSet']/*[local-name()='item']").map { |n| RouteServerEndpoint.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @route_server_endpoints
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@route_server_endpoints, @next_token)
  end
end
