private alias Core = Amazonite::Core

module Amazonite::EC2
  class AssociateRouteTableRequest
    # The ID of the internet gateway or virtual private gateway.
    property gateway_id : String | Nil

    # The ID of a public IPv4 pool. A public IPv4 pool is a pool of IPv4 addresses that you've brought
    # to Amazon Web Services with BYOIP.
    property public_ipv_4_pool : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the subnet.
    property subnet_id : String | Nil

    # The ID of the route table.
    property route_table_id : String

    def initialize(
      @route_table_id : String,
      @gateway_id : String | Nil = nil,
      @public_ipv_4_pool : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @subnet_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @gateway_id
        params << {"#{prefix}GatewayId", value}
      end

      if value = @public_ipv_4_pool
        params << {"#{prefix}PublicIpv4Pool", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      params << {"#{prefix}RouteTableId", @route_table_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='GatewayId']")),
        public_ipv_4_pool: Core::XMLValue.string(node.xpath_node("*[local-name()='PublicIpv4Pool']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")),
        route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='routeTableId']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@gateway_id, @public_ipv_4_pool, @dry_run, @subnet_id, @route_table_id)
  end
end
