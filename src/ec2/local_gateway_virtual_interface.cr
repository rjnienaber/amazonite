private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a local gateway virtual interface.
  class LocalGatewayVirtualInterface
    # The ID of the virtual interface.
    property local_gateway_virtual_interface_id : String | Nil

    # The ID of the local gateway.
    property local_gateway_id : String | Nil

    # The ID of the local gateway virtual interface group.
    property local_gateway_virtual_interface_group_id : String | Nil

    # The Amazon Resource Number (ARN) of the local gateway virtual interface.
    property local_gateway_virtual_interface_arn : String | Nil

    # The Outpost LAG ID.
    property outpost_lag_id : String | Nil

    # The ID of the VLAN.
    property vlan : Int32 | Nil

    # The local address.
    property local_address : String | Nil

    # The peer address.
    property peer_address : String | Nil

    # The Border Gateway Protocol (BGP) Autonomous System Number (ASN) of the local gateway.
    property local_bgp_asn : Int32 | Nil

    # The peer BGP ASN.
    property peer_bgp_asn : Int32 | Nil

    # The extended 32-bit ASN of the BGP peer for use with larger ASN values.
    property peer_bgp_asn_extended : Int64 | Nil

    # The ID of the Amazon Web Services account that owns the local gateway virtual interface.
    property owner_id : String | Nil

    # The tags assigned to the virtual interface.
    property tags : Array(Tag) | Nil

    # The current state of the local gateway virtual interface.
    property configuration_state : LocalGatewayVirtualInterfaceConfigurationState | Nil

    def initialize(
      @local_gateway_virtual_interface_id : String | Nil = nil,
      @local_gateway_id : String | Nil = nil,
      @local_gateway_virtual_interface_group_id : String | Nil = nil,
      @local_gateway_virtual_interface_arn : String | Nil = nil,
      @outpost_lag_id : String | Nil = nil,
      @vlan : Int32 | Nil = nil,
      @local_address : String | Nil = nil,
      @peer_address : String | Nil = nil,
      @local_bgp_asn : Int32 | Nil = nil,
      @peer_bgp_asn : Int32 | Nil = nil,
      @peer_bgp_asn_extended : Int64 | Nil = nil,
      @owner_id : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @configuration_state : LocalGatewayVirtualInterfaceConfigurationState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @local_gateway_virtual_interface_id
        params << {"#{prefix}LocalGatewayVirtualInterfaceId", value}
      end

      if value = @local_gateway_id
        params << {"#{prefix}LocalGatewayId", value}
      end

      if value = @local_gateway_virtual_interface_group_id
        params << {"#{prefix}LocalGatewayVirtualInterfaceGroupId", value}
      end

      if value = @local_gateway_virtual_interface_arn
        params << {"#{prefix}LocalGatewayVirtualInterfaceArn", value}
      end

      if value = @outpost_lag_id
        params << {"#{prefix}OutpostLagId", value}
      end

      if value = @vlan
        params << {"#{prefix}Vlan", value.to_s}
      end

      if value = @local_address
        params << {"#{prefix}LocalAddress", value}
      end

      if value = @peer_address
        params << {"#{prefix}PeerAddress", value}
      end

      if value = @local_bgp_asn
        params << {"#{prefix}LocalBgpAsn", value.to_s}
      end

      if value = @peer_bgp_asn
        params << {"#{prefix}PeerBgpAsn", value.to_s}
      end

      if value = @peer_bgp_asn_extended
        params << {"#{prefix}PeerBgpAsnExtended", value.to_s}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @configuration_state
        params << {"#{prefix}ConfigurationState", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        local_gateway_virtual_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='localGatewayVirtualInterfaceId']")),
        local_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='localGatewayId']")),
        local_gateway_virtual_interface_group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='localGatewayVirtualInterfaceGroupId']")),
        local_gateway_virtual_interface_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='localGatewayVirtualInterfaceArn']")),
        outpost_lag_id: Core::XMLValue.string(node.xpath_node("*[local-name()='outpostLagId']")),
        vlan: Core::XMLValue.i32(node.xpath_node("*[local-name()='vlan']")),
        local_address: Core::XMLValue.string(node.xpath_node("*[local-name()='localAddress']")),
        peer_address: Core::XMLValue.string(node.xpath_node("*[local-name()='peerAddress']")),
        local_bgp_asn: Core::XMLValue.i32(node.xpath_node("*[local-name()='localBgpAsn']")),
        peer_bgp_asn: Core::XMLValue.i32(node.xpath_node("*[local-name()='peerBgpAsn']")),
        peer_bgp_asn_extended: Core::XMLValue.i64(node.xpath_node("*[local-name()='peerBgpAsnExtended']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        configuration_state: (n = node.xpath_node("*[local-name()='configurationState']")) ? AEC::LocalGatewayVirtualInterfaceConfigurationState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @local_gateway_virtual_interface_arn
        raise Core::ValidationError.new("LocalGatewayVirtualInterfaceArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("LocalGatewayVirtualInterfaceArn length must be <= 1283") if value.size > 1283
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@local_gateway_virtual_interface_id, @local_gateway_id, @local_gateway_virtual_interface_group_id, @local_gateway_virtual_interface_arn, @outpost_lag_id, @vlan, @local_address, @peer_address, @local_bgp_asn, @peer_bgp_asn, @peer_bgp_asn_extended, @owner_id, @tags, @configuration_state)
  end
end
