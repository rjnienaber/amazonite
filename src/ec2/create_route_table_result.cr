private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateRouteTableResult
    # Information about the route table.
    property route_table : RouteTable | Nil

    # Unique, case-sensitive identifier to ensure the idempotency of the request. Only returned if a
    # client token was provided in the request.
    property client_token : String | Nil

    def initialize(
      @route_table : RouteTable | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @route_table
        params.concat(value.to_query_params("#{prefix}RouteTable."))
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        route_table: node.xpath_node("*[local-name()='routeTable']").try { |n| RouteTable.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='clientToken']")),
      )
    end

    def validate! : Nil
      if value = @route_table
        value.validate!
      end
    end

    def_equals_and_hash(@route_table, @client_token)
  end
end
