private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a virtual private gateway.
  class VpnGateway
    # The private Autonomous System Number (ASN) for the Amazon side of a BGP session.
    property amazon_side_asn : Int64 | Nil

    # Any tags assigned to the virtual private gateway.
    property tags : Array(Tag) | Nil

    # The ID of the virtual private gateway.
    property vpn_gateway_id : String | Nil

    # The current state of the virtual private gateway.
    property state : VpnState | Nil

    # The type of VPN connection the virtual private gateway supports.
    property type : GatewayType | Nil

    # The Availability Zone where the virtual private gateway was created, if applicable. This field
    # may be empty or not returned.
    property availability_zone : String | Nil

    # Any VPCs attached to the virtual private gateway.
    property vpc_attachments : Array(VpcAttachment) | Nil

    def initialize(
      @amazon_side_asn : Int64 | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @vpn_gateway_id : String | Nil = nil,
      @state : VpnState | Nil = nil,
      @type : GatewayType | Nil = nil,
      @availability_zone : String | Nil = nil,
      @vpc_attachments : Array(VpcAttachment) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @amazon_side_asn
        params << {"#{prefix}AmazonSideAsn", value.to_s}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @vpn_gateway_id
        params << {"#{prefix}VpnGatewayId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      (@vpc_attachments || [] of VpcAttachment).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Attachments.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        amazon_side_asn: Core::XMLValue.i64(node.xpath_node("*[local-name()='amazonSideAsn']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        vpn_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpnGatewayId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::VpnState.from_json_object_key?(n.content) : nil,
        type: (n = node.xpath_node("*[local-name()='type']")) ? AEC::GatewayType.from_json_object_key?(n.content) : nil,
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        vpc_attachments: node.xpath_nodes("*[local-name()='attachments']/*[local-name()='item']").map { |n| VpcAttachment.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end

      if value = @vpc_attachments
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@amazon_side_asn, @tags, @vpn_gateway_id, @state, @type, @availability_zone, @vpc_attachments)
  end
end
