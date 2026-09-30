private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the transit gateway multicast group resources.
  class TransitGatewayMulticastGroup
    # The IP address assigned to the transit gateway multicast group.
    property group_ip_address : String | Nil

    # The ID of the transit gateway attachment.
    property transit_gateway_attachment_id : String | Nil

    # The ID of the subnet.
    property subnet_id : String | Nil

    # The ID of the resource.
    property resource_id : String | Nil

    # The type of resource, for example a VPC attachment.
    property resource_type : TransitGatewayAttachmentResourceType | Nil

    # The ID of the Amazon Web Services account that owns the transit gateway multicast domain group
    # resource.
    property resource_owner_id : String | Nil

    # The ID of the transit gateway attachment.
    property network_interface_id : String | Nil

    # Indicates that the resource is a transit gateway multicast group member.
    property group_member : Bool | Nil

    # Indicates that the resource is a transit gateway multicast group member.
    property group_source : Bool | Nil

    # The member type (for example, `static`).
    property member_type : MembershipType | Nil

    # The source type.
    property source_type : MembershipType | Nil

    def initialize(
      @group_ip_address : String | Nil = nil,
      @transit_gateway_attachment_id : String | Nil = nil,
      @subnet_id : String | Nil = nil,
      @resource_id : String | Nil = nil,
      @resource_type : TransitGatewayAttachmentResourceType | Nil = nil,
      @resource_owner_id : String | Nil = nil,
      @network_interface_id : String | Nil = nil,
      @group_member : Bool | Nil = nil,
      @group_source : Bool | Nil = nil,
      @member_type : MembershipType | Nil = nil,
      @source_type : MembershipType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @group_ip_address
        params << {"#{prefix}GroupIpAddress", value}
      end

      if value = @transit_gateway_attachment_id
        params << {"#{prefix}TransitGatewayAttachmentId", value}
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      if value = @resource_id
        params << {"#{prefix}ResourceId", value}
      end

      if value = @resource_type
        params << {"#{prefix}ResourceType", value.to_json_object_key}
      end

      if value = @resource_owner_id
        params << {"#{prefix}ResourceOwnerId", value}
      end

      if value = @network_interface_id
        params << {"#{prefix}NetworkInterfaceId", value}
      end

      if value = @group_member
        params << {"#{prefix}GroupMember", Core::QueryValue.bool(value)}
      end

      if value = @group_source
        params << {"#{prefix}GroupSource", Core::QueryValue.bool(value)}
      end

      if value = @member_type
        params << {"#{prefix}MemberType", value.to_json_object_key}
      end

      if value = @source_type
        params << {"#{prefix}SourceType", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        group_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='groupIpAddress']")),
        transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayAttachmentId']")),
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")),
        resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceId']")),
        resource_type: (n = node.xpath_node("*[local-name()='resourceType']")) ? AEC::TransitGatewayAttachmentResourceType.from_json_object_key?(n.content) : nil,
        resource_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceOwnerId']")),
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceId']")),
        group_member: Core::XMLValue.bool(node.xpath_node("*[local-name()='groupMember']")),
        group_source: Core::XMLValue.bool(node.xpath_node("*[local-name()='groupSource']")),
        member_type: (n = node.xpath_node("*[local-name()='memberType']")) ? AEC::MembershipType.from_json_object_key?(n.content) : nil,
        source_type: (n = node.xpath_node("*[local-name()='sourceType']")) ? AEC::MembershipType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@group_ip_address, @transit_gateway_attachment_id, @subnet_id, @resource_id, @resource_type, @resource_owner_id, @network_interface_id, @group_member, @group_source, @member_type, @source_type)
  end
end
