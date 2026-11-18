private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains information about a transit gateway network function attachment, including the
  # attachment ID, the transit gateway, the endpoint service, the Availability Zones, and the state
  # of the attachment.
  class TransitGatewayNetworkFunctionAttachment
    # The ID of the attachment.
    property transit_gateway_attachment_id : String | Nil

    # The ID of the transit gateway.
    property transit_gateway_id : String | Nil

    # The ID of the Amazon Web Services account that owns the transit gateway.
    property transit_gateway_owner_id : String | Nil

    # The ID of the Amazon Web Services account that owns the attachment.
    property resource_owner_id : String | Nil

    # The name of the Gateway Load Balancer endpoint service.
    property resource_id : String | Nil

    # The names of the Availability Zones for the attachment.
    property availability_zones : Array(String) | Nil

    # The IDs of the Availability Zones for the attachment.
    property availability_zone_ids : Array(String) | Nil

    # The state of the attachment.
    property state : TransitGatewayAttachmentState | Nil

    # The date and time the attachment was created.
    property creation_time : Time | Nil

    # The tags for the attachment.
    property tags : Array(Tag) | Nil

    def initialize(
      @transit_gateway_attachment_id : String | Nil = nil,
      @transit_gateway_id : String | Nil = nil,
      @transit_gateway_owner_id : String | Nil = nil,
      @resource_owner_id : String | Nil = nil,
      @resource_id : String | Nil = nil,
      @availability_zones : Array(String) | Nil = nil,
      @availability_zone_ids : Array(String) | Nil = nil,
      @state : TransitGatewayAttachmentState | Nil = nil,
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

      if value = @resource_id
        params << {"#{prefix}ResourceId", value}
      end

      (@availability_zones || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AvailabilityZoneSet.#{i}", item}
      end

      (@availability_zone_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AvailabilityZoneIdSet.#{i}", item}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
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
        resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceId']")),
        availability_zones: node.xpath_nodes("*[local-name()='availabilityZoneSet']/*[local-name()='item']").map { |n| n.content },
        availability_zone_ids: node.xpath_nodes("*[local-name()='availabilityZoneIdSet']/*[local-name()='item']").map { |n| n.content },
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::TransitGatewayAttachmentState.from_json_object_key?(n.content) : nil,
        creation_time: Core::XMLValue.time(node.xpath_node("*[local-name()='creationTime']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@transit_gateway_attachment_id, @transit_gateway_id, @transit_gateway_owner_id, @resource_owner_id, @resource_id, @availability_zones, @availability_zone_ids, @state, @creation_time, @tags)
  end
end
