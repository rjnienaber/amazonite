private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an attachment between a resource and a transit gateway.
  class TransitGatewayAttachment
    # The ID of the attachment.
    property transit_gateway_attachment_id : String | Nil

    # The ID of the transit gateway.
    property transit_gateway_id : String | Nil

    # The ID of the Amazon Web Services account that owns the transit gateway.
    property transit_gateway_owner_id : String | Nil

    # The ID of the Amazon Web Services account that owns the resource.
    property resource_owner_id : String | Nil

    # The resource type. Note that the `tgw-peering` resource type has been deprecated.
    property resource_type : TransitGatewayAttachmentResourceType | Nil

    # The ID of the resource.
    property resource_id : String | Nil

    # The attachment state. Note that the `initiating` state has been deprecated.
    property state : TransitGatewayAttachmentState | Nil

    # The association.
    property association : TransitGatewayAttachmentAssociation | Nil

    # The creation time.
    property creation_time : Time | Nil

    # The tags for the attachment.
    property tags : Array(Tag) | Nil

    def initialize(
      @transit_gateway_attachment_id : String | Nil = nil,
      @transit_gateway_id : String | Nil = nil,
      @transit_gateway_owner_id : String | Nil = nil,
      @resource_owner_id : String | Nil = nil,
      @resource_type : TransitGatewayAttachmentResourceType | Nil = nil,
      @resource_id : String | Nil = nil,
      @state : TransitGatewayAttachmentState | Nil = nil,
      @association : TransitGatewayAttachmentAssociation | Nil = nil,
      @creation_time : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_attachment_id
        params << {"#{prefix}TransitGatewayAttachmentId", value}
      end

      if value = @transit_gateway_id
        params << {"#{prefix}TransitGatewayId", value}
      end

      if value = @transit_gateway_owner_id
        params << {"#{prefix}TransitGatewayOwnerId", value}
      end

      if value = @resource_owner_id
        params << {"#{prefix}ResourceOwnerId", value}
      end

      if value = @resource_type
        params << {"#{prefix}ResourceType", value.to_json_object_key}
      end

      if value = @resource_id
        params << {"#{prefix}ResourceId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @association
        params.concat(value.to_query_params("#{prefix}Association."))
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
        transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayAttachmentId']")),
        transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayId']")),
        transit_gateway_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayOwnerId']")),
        resource_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceOwnerId']")),
        resource_type: (n = node.xpath_node("*[local-name()='resourceType']")) ? AEC::TransitGatewayAttachmentResourceType.from_json_object_key?(n.content) : nil,
        resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::TransitGatewayAttachmentState.from_json_object_key?(n.content) : nil,
        association: node.xpath_node("*[local-name()='association']").try { |n| TransitGatewayAttachmentAssociation.from_xml(n) },
        creation_time: Core::XMLValue.time(node.xpath_node("*[local-name()='creationTime']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @association
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@transit_gateway_attachment_id, @transit_gateway_id, @transit_gateway_owner_id, @resource_owner_id, @resource_type, @resource_id, @state, @association, @creation_time, @tags)
  end
end
