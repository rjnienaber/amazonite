private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateTransitGatewayMeteringPolicyEntryRequest
    # The ID of the transit gateway metering policy to add the entry to.
    property transit_gateway_metering_policy_id : String

    # The rule number for the metering policy entry. Rules are processed in order from lowest to
    # highest number.
    property policy_rule_number : Int32

    # The ID of the source transit gateway attachment for traffic matching.
    property source_transit_gateway_attachment_id : String | Nil

    # The type of the source transit gateway attachment for traffic matching. Note that the
    # `tgw-peering` resource type has been deprecated. To configure metering policies for Connect, use
    # the transport attachment type.
    property source_transit_gateway_attachment_type : TransitGatewayAttachmentResourceType | Nil

    # The source CIDR block for traffic matching.
    property source_cidr_block : String | Nil

    # The source port range for traffic matching.
    property source_port_range : String | Nil

    # The ID of the destination transit gateway attachment for traffic matching.
    property destination_transit_gateway_attachment_id : String | Nil

    # The type of the destination transit gateway attachment for traffic matching. Note that the
    # `tgw-peering` resource type has been deprecated. To configure metering policies for Connect, use
    # the transport attachment type.
    property destination_transit_gateway_attachment_type : TransitGatewayAttachmentResourceType | Nil

    # The destination CIDR block for traffic matching.
    property destination_cidr_block : String | Nil

    # The destination port range for traffic matching.
    property destination_port_range : String | Nil

    # The protocol for traffic matching (1, 6, 17, etc.).
    property protocol : String | Nil

    # The Amazon Web Services account ID to which the metered traffic should be attributed.
    property metered_account : TransitGatewayMeteringPayerType

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @transit_gateway_metering_policy_id : String,
      @policy_rule_number : Int32,
      @metered_account : TransitGatewayMeteringPayerType,
      @source_transit_gateway_attachment_id : String | Nil = nil,
      @source_transit_gateway_attachment_type : TransitGatewayAttachmentResourceType | Nil = nil,
      @source_cidr_block : String | Nil = nil,
      @source_port_range : String | Nil = nil,
      @destination_transit_gateway_attachment_id : String | Nil = nil,
      @destination_transit_gateway_attachment_type : TransitGatewayAttachmentResourceType | Nil = nil,
      @destination_cidr_block : String | Nil = nil,
      @destination_port_range : String | Nil = nil,
      @protocol : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TransitGatewayMeteringPolicyId", @transit_gateway_metering_policy_id}

      params << {"#{prefix}PolicyRuleNumber", @policy_rule_number.to_s}

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

      params << {"#{prefix}MeteredAccount", @metered_account.to_json_object_key}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_metering_policy_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayMeteringPolicyId']")).not_nil!,
        policy_rule_number: Core::XMLValue.i32(node.xpath_node("*[local-name()='PolicyRuleNumber']")).not_nil!,
        source_transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceTransitGatewayAttachmentId']")),
        source_transit_gateway_attachment_type: (n = node.xpath_node("*[local-name()='SourceTransitGatewayAttachmentType']")) ? AEC::TransitGatewayAttachmentResourceType.from_json_object_key?(n.content) : nil,
        source_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceCidrBlock']")),
        source_port_range: Core::XMLValue.string(node.xpath_node("*[local-name()='SourcePortRange']")),
        destination_transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='DestinationTransitGatewayAttachmentId']")),
        destination_transit_gateway_attachment_type: (n = node.xpath_node("*[local-name()='DestinationTransitGatewayAttachmentType']")) ? AEC::TransitGatewayAttachmentResourceType.from_json_object_key?(n.content) : nil,
        destination_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='DestinationCidrBlock']")),
        destination_port_range: Core::XMLValue.string(node.xpath_node("*[local-name()='DestinationPortRange']")),
        protocol: Core::XMLValue.string(node.xpath_node("*[local-name()='Protocol']")),
        metered_account: ((n = node.xpath_node("*[local-name()='MeteredAccount']")) ? AEC::TransitGatewayMeteringPayerType.from_json_object_key?(n.content) : nil).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@transit_gateway_metering_policy_id, @policy_rule_number, @source_transit_gateway_attachment_id, @source_transit_gateway_attachment_type, @source_cidr_block, @source_port_range, @destination_transit_gateway_attachment_id, @destination_transit_gateway_attachment_type, @destination_cidr_block, @destination_port_range, @protocol, @metered_account, @dry_run)
  end
end
