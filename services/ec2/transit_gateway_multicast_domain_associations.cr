private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the multicast domain associations.
  class TransitGatewayMulticastDomainAssociations
    # The ID of the transit gateway multicast domain.
    property transit_gateway_multicast_domain_id : String | Nil

    # The ID of the transit gateway attachment.
    property transit_gateway_attachment_id : String | Nil

    # The ID of the resource.
    property resource_id : String | Nil

    # The type of resource, for example a VPC attachment.
    property resource_type : TransitGatewayAttachmentResourceType | Nil

    # The ID of the Amazon Web Services account that owns the resource.
    property resource_owner_id : String | Nil

    # The subnets associated with the multicast domain.
    property subnets : Array(SubnetAssociation) | Nil

    def initialize(
      @transit_gateway_multicast_domain_id : String | Nil = nil,
      @transit_gateway_attachment_id : String | Nil = nil,
      @resource_id : String | Nil = nil,
      @resource_type : TransitGatewayAttachmentResourceType | Nil = nil,
      @resource_owner_id : String | Nil = nil,
      @subnets : Array(SubnetAssociation) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_multicast_domain_id
        params << {"#{prefix}TransitGatewayMulticastDomainId", value}
      end

      if value = @transit_gateway_attachment_id
        params << {"#{prefix}TransitGatewayAttachmentId", value}
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

      (@subnets || [] of SubnetAssociation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Subnets.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_multicast_domain_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayMulticastDomainId']")),
        transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayAttachmentId']")),
        resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceId']")),
        resource_type: (n = node.xpath_node("*[local-name()='resourceType']")) ? AEC::TransitGatewayAttachmentResourceType.from_json_object_key?(n.content) : nil,
        resource_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceOwnerId']")),
        subnets: node.xpath_nodes("*[local-name()='subnets']/*[local-name()='item']").map { |n| SubnetAssociation.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @subnets
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@transit_gateway_multicast_domain_id, @transit_gateway_attachment_id, @resource_id, @resource_type, @resource_owner_id, @subnets)
  end
end
