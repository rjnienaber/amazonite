private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetRouteServerRoutingDatabaseRequest
    # The ID of the route server for which to get the routing database.
    property route_server_id : String

    # The token for the next page of results.
    property next_token : String | Nil

    # The maximum number of routing database entries to return in a single response.
    property max_results : Int32 | Nil

    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Filters to apply to the routing database query.
    property filters : Array(Filter) | Nil

    def initialize(
      @route_server_id : String,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}RouteServerId", @route_server_id}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        route_server_id: Core::XMLValue.string(node.xpath_node("*[local-name()='RouteServerId']")).not_nil!,
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 5") if value < 5
        raise Core::ValidationError.new("MaxResults value must be <= 1000") if value > 1000
      end

      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@route_server_id, @next_token, @max_results, @dry_run, @filters)
  end
end
