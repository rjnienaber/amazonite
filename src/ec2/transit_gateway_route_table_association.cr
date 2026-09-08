private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an association between a route table and a resource attachment.
  class TransitGatewayRouteTableAssociation
    # The ID of the attachment.
    property transit_gateway_attachment_id : String | Nil

    # The ID of the resource.
    property resource_id : String | Nil

    # The resource type. Note that the `tgw-peering` resource type has been deprecated.
    property resource_type : TransitGatewayAttachmentResourceType | Nil

    # The state of the association.
    property state : TransitGatewayAssociationState | Nil

    def initialize(
      @transit_gateway_attachment_id : String | Nil = nil,
      @resource_id : String | Nil = nil,
      @resource_type : TransitGatewayAttachmentResourceType | Nil = nil,
      @state : TransitGatewayAssociationState | Nil = nil,
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
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayAttachmentId']")),
        resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceId']")),
        resource_type: (n = node.xpath_node("*[local-name()='resourceType']")) ? AEC::TransitGatewayAttachmentResourceType.from_json_object_key?(n.content) : nil,
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::TransitGatewayAssociationState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@transit_gateway_attachment_id, @resource_id, @resource_type, @state)
  end
end
