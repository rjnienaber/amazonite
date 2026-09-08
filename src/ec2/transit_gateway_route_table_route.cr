private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a route in a transit gateway route table.
  class TransitGatewayRouteTableRoute
    # The CIDR block used for destination matches.
    property destination_cidr : String | Nil

    # The state of the route.
    property state : String | Nil

    # The route origin. The following are the possible values:
    #
    # - static
    #
    # - propagated
    property route_origin : String | Nil

    # The ID of the prefix list.
    property prefix_list_id : String | Nil

    # The ID of the route attachment.
    property attachment_id : String | Nil

    # The ID of the resource for the route attachment.
    property resource_id : String | Nil

    # The resource type for the route attachment.
    property resource_type : String | Nil

    def initialize(
      @destination_cidr : String | Nil = nil,
      @state : String | Nil = nil,
      @route_origin : String | Nil = nil,
      @prefix_list_id : String | Nil = nil,
      @attachment_id : String | Nil = nil,
      @resource_id : String | Nil = nil,
      @resource_type : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @destination_cidr
        params << {"#{prefix}DestinationCidr", value}
      end

      if value = @state
        params << {"#{prefix}State", value}
      end

      if value = @route_origin
        params << {"#{prefix}RouteOrigin", value}
      end

      if value = @prefix_list_id
        params << {"#{prefix}PrefixListId", value}
      end

      if value = @attachment_id
        params << {"#{prefix}AttachmentId", value}
      end

      if value = @resource_id
        params << {"#{prefix}ResourceId", value}
      end

      if value = @resource_type
        params << {"#{prefix}ResourceType", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        destination_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='destinationCidr']")),
        state: Core::XMLValue.string(node.xpath_node("*[local-name()='state']")),
        route_origin: Core::XMLValue.string(node.xpath_node("*[local-name()='routeOrigin']")),
        prefix_list_id: Core::XMLValue.string(node.xpath_node("*[local-name()='prefixListId']")),
        attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='attachmentId']")),
        resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceId']")),
        resource_type: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceType']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@destination_cidr, @state, @route_origin, @prefix_list_id, @attachment_id, @resource_id, @resource_type)
  end
end
