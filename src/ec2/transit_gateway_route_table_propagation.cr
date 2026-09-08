private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a route table propagation.
  class TransitGatewayRouteTablePropagation
    # The ID of the attachment.
    property transit_gateway_attachment_id : String | Nil

    # The ID of the resource.
    property resource_id : String | Nil

    # The type of resource. Note that the `tgw-peering` resource type has been deprecated.
    property resource_type : TransitGatewayAttachmentResourceType | Nil

    # The state of the resource.
    property state : TransitGatewayPropagationState | Nil

    # The ID of the transit gateway route table announcement.
    property transit_gateway_route_table_announcement_id : String | Nil

    def initialize(
      @transit_gateway_attachment_id : String | Nil = nil,
      @resource_id : String | Nil = nil,
      @resource_type : TransitGatewayAttachmentResourceType | Nil = nil,
      @state : TransitGatewayPropagationState | Nil = nil,
      @transit_gateway_route_table_announcement_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_attachment_id
        params << {"#{prefix}TransitGatewayAttachmentId", value}
      end

      if value = @resource_id
        params << {"#{prefix}ResourceId", value}
      end

      if value = @resource_type
        params << {"#{prefix}ResourceType", value.to_json_object_key}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @transit_gateway_route_table_announcement_id
        params << {"#{prefix}TransitGatewayRouteTableAnnouncementId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayAttachmentId']")),
        resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceId']")),
        resource_type: (n = node.xpath_node("*[local-name()='resourceType']")) ? AEC::TransitGatewayAttachmentResourceType.from_json_object_key?(n.content) : nil,
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::TransitGatewayPropagationState.from_json_object_key?(n.content) : nil,
        transit_gateway_route_table_announcement_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayRouteTableAnnouncementId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@transit_gateway_attachment_id, @resource_id, @resource_type, @state, @transit_gateway_route_table_announcement_id)
  end
end
