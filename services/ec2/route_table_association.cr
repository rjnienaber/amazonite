private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an association between a route table and a subnet or gateway.
  class RouteTableAssociation
    # Indicates whether this is the main route table.
    property main : Bool | Nil

    # The ID of the association.
    property route_table_association_id : String | Nil

    # The ID of the route table.
    property route_table_id : String | Nil

    # The ID of the subnet. A subnet ID is not returned for an implicit association.
    property subnet_id : String | Nil

    # The ID of the internet gateway or virtual private gateway.
    property gateway_id : String | Nil

    # The ID of a public IPv4 pool. A public IPv4 pool is a pool of IPv4 addresses that you've brought
    # to Amazon Web Services with BYOIP.
    property public_ipv_4_pool : String | Nil

    # The state of the association.
    property association_state : RouteTableAssociationState | Nil

    def initialize(
      @main : Bool | Nil = nil,
      @route_table_association_id : String | Nil = nil,
      @route_table_id : String | Nil = nil,
      @subnet_id : String | Nil = nil,
      @gateway_id : String | Nil = nil,
      @public_ipv_4_pool : String | Nil = nil,
      @association_state : RouteTableAssociationState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @main
        params << {"#{prefix}Main", Core::QueryValue.bool(value)}
      end

      if value = @route_table_association_id
        params << {"#{prefix}RouteTableAssociationId", value}
      end

      if value = @route_table_id
        params << {"#{prefix}RouteTableId", value}
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      if value = @gateway_id
        params << {"#{prefix}GatewayId", value}
      end

      if value = @public_ipv_4_pool
        params << {"#{prefix}PublicIpv4Pool", value}
      end

      if value = @association_state
        params.concat(value.to_query_params("#{prefix}AssociationState."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        main: Core::XMLValue.bool(node.xpath_node("*[local-name()='main']")),
        route_table_association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='routeTableAssociationId']")),
        route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='routeTableId']")),
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")),
        gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='gatewayId']")),
        public_ipv_4_pool: Core::XMLValue.string(node.xpath_node("*[local-name()='publicIpv4Pool']")),
        association_state: node.xpath_node("*[local-name()='associationState']").try { |n| RouteTableAssociationState.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @association_state
        value.validate!
      end
    end

    def_equals_and_hash(@main, @route_table_association_id, @route_table_id, @subnet_id, @gateway_id, @public_ipv_4_pool, @association_state)
  end
end
