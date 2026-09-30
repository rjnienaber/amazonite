private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a transit gateway route table.
  class TransitGatewayRouteTable
    # The ID of the transit gateway route table.
    property transit_gateway_route_table_id : String | Nil

    # The ID of the transit gateway.
    property transit_gateway_id : String | Nil

    # The state of the transit gateway route table.
    property state : TransitGatewayRouteTableState | Nil

    # Indicates whether this is the default association route table for the transit gateway.
    property default_association_route_table : Bool | Nil

    # Indicates whether this is the default propagation route table for the transit gateway.
    property default_propagation_route_table : Bool | Nil

    # The creation time.
    property creation_time : Time | Nil

    # Any tags assigned to the route table.
    property tags : Array(Tag) | Nil

    def initialize(
      @transit_gateway_route_table_id : String | Nil = nil,
      @transit_gateway_id : String | Nil = nil,
      @state : TransitGatewayRouteTableState | Nil = nil,
      @default_association_route_table : Bool | Nil = nil,
      @default_propagation_route_table : Bool | Nil = nil,
      @creation_time : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_route_table_id
        params << {"#{prefix}TransitGatewayRouteTableId", value}
      end

      if value = @transit_gateway_id
        params << {"#{prefix}TransitGatewayId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @default_association_route_table
        params << {"#{prefix}DefaultAssociationRouteTable", Core::QueryValue.bool(value)}
      end

      if value = @default_propagation_route_table
        params << {"#{prefix}DefaultPropagationRouteTable", Core::QueryValue.bool(value)}
      end

      if value = @creation_time
        params << {"#{prefix}CreationTime", Core::QueryValue.time(value)}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayRouteTableId']")),
        transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::TransitGatewayRouteTableState.from_json_object_key?(n.content) : nil,
        default_association_route_table: Core::XMLValue.bool(node.xpath_node("*[local-name()='defaultAssociationRouteTable']")),
        default_propagation_route_table: Core::XMLValue.bool(node.xpath_node("*[local-name()='defaultPropagationRouteTable']")),
        creation_time: Core::XMLValue.time(node.xpath_node("*[local-name()='creationTime']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@transit_gateway_route_table_id, @transit_gateway_id, @state, @default_association_route_table, @default_propagation_route_table, @creation_time, @tags)
  end
end
