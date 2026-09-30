private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the traffic matching criteria for a transit gateway metering policy rule.
  class TransitGatewayMeteringPolicyRule
    # The ID of the source transit gateway attachment.
    property source_transit_gateway_attachment_id : String | Nil

    # The type of the source transit gateway attachment. Note that the `tgw-peering` resource type has
    # been deprecated. To configure metering policies for Connect, use the transport attachment type.
    property source_transit_gateway_attachment_type : TransitGatewayAttachmentResourceType | Nil

    # The source CIDR block for the rule.
    property source_cidr_block : String | Nil

    # The source port range for the rule.
    property source_port_range : String | Nil

    # The ID of the destination transit gateway attachment.
    property destination_transit_gateway_attachment_id : String | Nil

    # The type of the destination transit gateway attachment. Note that the `tgw-peering` resource
    # type has been deprecated. To configure metering policies for Connect, use the transport
    # attachment type.
    property destination_transit_gateway_attachment_type : TransitGatewayAttachmentResourceType | Nil

    # The destination CIDR block for the rule.
    property destination_cidr_block : String | Nil

    # The destination port range for the rule.
    property destination_port_range : String | Nil

    # The protocol for the rule (1, 6, 17, etc.).
    property protocol : String | Nil

    def initialize(
      @source_transit_gateway_attachment_id : String | Nil = nil,
      @source_transit_gateway_attachment_type : TransitGatewayAttachmentResourceType | Nil = nil,
      @source_cidr_block : String | Nil = nil,
      @source_port_range : String | Nil = nil,
      @destination_transit_gateway_attachment_id : String | Nil = nil,
      @destination_transit_gateway_attachment_type : TransitGatewayAttachmentResourceType | Nil = nil,
      @destination_cidr_block : String | Nil = nil,
      @destination_port_range : String | Nil = nil,
      @protocol : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @source_transit_gateway_attachment_id
        params << {"#{prefix}SourceTransitGatewayAttachmentId", value}
      end

      if value = @source_transit_gateway_attachment_type
        params << {"#{prefix}SourceTransitGatewayAttachmentType", value.to_json_object_key}
      end

      if value = @source_cidr_block
        params << {"#{prefix}SourceCidrBlock", value}
      end

      if value = @source_port_range
        params << {"#{prefix}SourcePortRange", value}
      end

      if value = @destination_transit_gateway_attachment_id
        params << {"#{prefix}DestinationTransitGatewayAttachmentId", value}
      end

      if value = @destination_transit_gateway_attachment_type
        params << {"#{prefix}DestinationTransitGatewayAttachmentType", value.to_json_object_key}
      end

      if value = @destination_cidr_block
        params << {"#{prefix}DestinationCidrBlock", value}
      end

      if value = @destination_port_range
        params << {"#{prefix}DestinationPortRange", value}
      end

      if value = @protocol
        params << {"#{prefix}Protocol", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        source_transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='sourceTransitGatewayAttachmentId']")),
        source_transit_gateway_attachment_type: (n = node.xpath_node("*[local-name()='sourceTransitGatewayAttachmentType']")) ? AEC::TransitGatewayAttachmentResourceType.from_json_object_key?(n.content) : nil,
        source_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='sourceCidrBlock']")),
        source_port_range: Core::XMLValue.string(node.xpath_node("*[local-name()='sourcePortRange']")),
        destination_transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='destinationTransitGatewayAttachmentId']")),
        destination_transit_gateway_attachment_type: (n = node.xpath_node("*[local-name()='destinationTransitGatewayAttachmentType']")) ? AEC::TransitGatewayAttachmentResourceType.from_json_object_key?(n.content) : nil,
        destination_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='destinationCidrBlock']")),
        destination_port_range: Core::XMLValue.string(node.xpath_node("*[local-name()='destinationPortRange']")),
        protocol: Core::XMLValue.string(node.xpath_node("*[local-name()='protocol']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@source_transit_gateway_attachment_id, @source_transit_gateway_attachment_type, @source_cidr_block, @source_port_range, @destination_transit_gateway_attachment_id, @destination_transit_gateway_attachment_type, @destination_cidr_block, @destination_port_range, @protocol)
  end
end
