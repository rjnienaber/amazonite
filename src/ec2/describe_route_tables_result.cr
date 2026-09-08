private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output of DescribeRouteTables.
  class DescribeRouteTablesResult
    # Information about the route tables.
    property route_tables : Array(RouteTable) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @route_tables : Array(RouteTable) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@route_tables || [] of RouteTable).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RouteTableSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        route_tables: node.xpath_nodes("*[local-name()='routeTableSet']/*[local-name()='item']").map { |n| RouteTable.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @route_tables
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@route_tables, @next_token)
  end
end
