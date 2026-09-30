private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a local gateway virtual interface group.
  class LocalGatewayVirtualInterfaceGroup
    # The ID of the virtual interface group.
    property local_gateway_virtual_interface_group_id : String | Nil

    # The IDs of the virtual interfaces.
    property local_gateway_virtual_interface_ids : Array(String) | Nil

    # The ID of the local gateway.
    property local_gateway_id : String | Nil

    # The ID of the Amazon Web Services account that owns the local gateway virtual interface group.
    property owner_id : String | Nil

    # The Autonomous System Number(ASN) for the local Border Gateway Protocol (BGP).
    property local_bgp_asn : Int32 | Nil

    # The extended 32-bit ASN for the local BGP configuration.
    property local_bgp_asn_extended : Int64 | Nil

    # The Amazon Resource Number (ARN) of the local gateway virtual interface group.
    property local_gateway_virtual_interface_group_arn : String | Nil

    # The tags assigned to the virtual interface group.
    property tags : Array(Tag) | Nil

    # The current state of the local gateway virtual interface group.
    property configuration_state : LocalGatewayVirtualInterfaceGroupConfigurationState | Nil

    def initialize(
      @local_gateway_virtual_interface_group_id : String | Nil = nil,
      @local_gateway_virtual_interface_ids : Array(String) | Nil = nil,
      @local_gateway_id : String | Nil = nil,
      @owner_id : String | Nil = nil,
      @local_bgp_asn : Int32 | Nil = nil,
      @local_bgp_asn_extended : Int64 | Nil = nil,
      @local_gateway_virtual_interface_group_arn : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @configuration_state : LocalGatewayVirtualInterfaceGroupConfigurationState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @local_gateway_virtual_interface_group_id
        params << {"#{prefix}LocalGatewayVirtualInterfaceGroupId", value}
      end

      (@local_gateway_virtual_interface_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}LocalGatewayVirtualInterfaceIdSet.#{i}", item}
      end

      if value = @local_gateway_id
        params << {"#{prefix}LocalGatewayId", value}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @local_bgp_asn
        params << {"#{prefix}LocalBgpAsn", value.to_s}
      end

      if value = @local_bgp_asn_extended
        params << {"#{prefix}LocalBgpAsnExtended", value.to_s}
      end

      if value = @local_gateway_virtual_interface_group_arn
        params << {"#{prefix}LocalGatewayVirtualInterfaceGroupArn", value}
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
        local_gateway_virtual_interface_group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='localGatewayVirtualInterfaceGroupId']")),
        local_gateway_virtual_interface_ids: node.xpath_nodes("*[local-name()='localGatewayVirtualInterfaceIdSet']/*[local-name()='item']").map { |n| n.content },
        local_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='localGatewayId']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        local_bgp_asn: Core::XMLValue.i32(node.xpath_node("*[local-name()='localBgpAsn']")),
        local_bgp_asn_extended: Core::XMLValue.i64(node.xpath_node("*[local-name()='localBgpAsnExtended']")),
        local_gateway_virtual_interface_group_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='localGatewayVirtualInterfaceGroupArn']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        configuration_state: (n = node.xpath_node("*[local-name()='configurationState']")) ? AEC::LocalGatewayVirtualInterfaceGroupConfigurationState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @local_gateway_virtual_interface_group_arn
        raise Core::ValidationError.new("LocalGatewayVirtualInterfaceGroupArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("LocalGatewayVirtualInterfaceGroupArn length must be <= 1283") if value.size > 1283
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@local_gateway_virtual_interface_group_id, @local_gateway_virtual_interface_ids, @local_gateway_id, @owner_id, @local_bgp_asn, @local_bgp_asn_extended, @local_gateway_virtual_interface_group_arn, @tags, @configuration_state)
  end
end
