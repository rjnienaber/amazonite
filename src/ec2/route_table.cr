private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a route table.
  class RouteTable
    # The associations between the route table and your subnets or gateways.
    property associations : Array(RouteTableAssociation) | Nil

    # Any virtual private gateway (VGW) propagating routes.
    property propagating_vgws : Array(PropagatingVgw) | Nil

    # The ID of the route table.
    property route_table_id : String | Nil

    # The routes in the route table.
    property routes : Array(Route) | Nil

    # Any tags assigned to the route table.
    property tags : Array(Tag) | Nil

    # The ID of the VPC.
    property vpc_id : String | Nil

    # The ID of the Amazon Web Services account that owns the route table.
    property owner_id : String | Nil

    def initialize(
      @associations : Array(RouteTableAssociation) | Nil = nil,
      @propagating_vgws : Array(PropagatingVgw) | Nil = nil,
      @route_table_id : String | Nil = nil,
      @routes : Array(Route) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @vpc_id : String | Nil = nil,
      @owner_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@associations || [] of RouteTableAssociation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AssociationSet.#{i}."))
      end

      (@propagating_vgws || [] of PropagatingVgw).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PropagatingVgwSet.#{i}."))
      end

      if value = @route_table_id
        params << {"#{prefix}RouteTableId", value}
      end

      (@routes || [] of Route).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RouteSet.#{i}."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        associations: node.xpath_nodes("*[local-name()='associationSet']/*[local-name()='item']").map { |n| RouteTableAssociation.from_xml(n) },
        propagating_vgws: node.xpath_nodes("*[local-name()='propagatingVgwSet']/*[local-name()='item']").map { |n| PropagatingVgw.from_xml(n) },
        route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='routeTableId']")),
        routes: node.xpath_nodes("*[local-name()='routeSet']/*[local-name()='item']").map { |n| Route.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
      )
    end

    def validate! : Nil
      if value = @associations
        value.each(&.validate!)
      end

      if value = @propagating_vgws
        value.each(&.validate!)
      end

      if value = @routes
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@associations, @propagating_vgws, @route_table_id, @routes, @tags, @vpc_id, @owner_id)
  end
end
