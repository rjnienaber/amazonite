private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the service link virtual interfaces that establish connectivity between Amazon Web
  # Services Outpost and on-premises networks.
  class ServiceLinkVirtualInterface
    # The ID of the service link virtual interface.
    property service_link_virtual_interface_id : String | Nil

    # The Amazon Resource Number (ARN) for the service link virtual interface.
    property service_link_virtual_interface_arn : String | Nil

    # The Outpost ID for the service link virtual interface.
    property outpost_id : String | Nil

    # The Outpost Amazon Resource Number (ARN) for the service link virtual interface.
    property outpost_arn : String | Nil

    # The ID of the Amazon Web Services account that owns the service link virtual interface..
    property owner_id : String | Nil

    # The IPv4 address assigned to the local gateway virtual interface on the Outpost side.
    property local_address : String | Nil

    # The IPv4 peer address for the service link virtual interface.
    property peer_address : String | Nil

    # The ASN for the Border Gateway Protocol (BGP) associated with the service link virtual
    # interface.
    property peer_bgp_asn : Int64 | Nil

    # The virtual local area network for the service link virtual interface.
    property vlan : Int32 | Nil

    # The link aggregation group (LAG) ID for the service link virtual interface.
    property outpost_lag_id : String | Nil

    # The tags associated with the service link virtual interface.
    property tags : Array(Tag) | Nil

    # The current state of the service link virtual interface.
    property configuration_state : ServiceLinkVirtualInterfaceConfigurationState | Nil

    def initialize(
      @service_link_virtual_interface_id : String | Nil = nil,
      @service_link_virtual_interface_arn : String | Nil = nil,
      @outpost_id : String | Nil = nil,
      @outpost_arn : String | Nil = nil,
      @owner_id : String | Nil = nil,
      @local_address : String | Nil = nil,
      @peer_address : String | Nil = nil,
      @peer_bgp_asn : Int64 | Nil = nil,
      @vlan : Int32 | Nil = nil,
      @outpost_lag_id : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @configuration_state : ServiceLinkVirtualInterfaceConfigurationState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @service_link_virtual_interface_id
        params << {"#{prefix}ServiceLinkVirtualInterfaceId", value}
      end

      if value = @service_link_virtual_interface_arn
        params << {"#{prefix}ServiceLinkVirtualInterfaceArn", value}
      end

      if value = @outpost_id
        params << {"#{prefix}OutpostId", value}
      end

      if value = @outpost_arn
        params << {"#{prefix}OutpostArn", value}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @local_address
        params << {"#{prefix}LocalAddress", value}
      end

      if value = @peer_address
        params << {"#{prefix}PeerAddress", value}
      end

      if value = @peer_bgp_asn
        params << {"#{prefix}PeerBgpAsn", value.to_s}
      end

      if value = @vlan
        params << {"#{prefix}Vlan", value.to_s}
      end

      if value = @outpost_lag_id
        params << {"#{prefix}OutpostLagId", value}
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
        service_link_virtual_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='serviceLinkVirtualInterfaceId']")),
        service_link_virtual_interface_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='serviceLinkVirtualInterfaceArn']")),
        outpost_id: Core::XMLValue.string(node.xpath_node("*[local-name()='outpostId']")),
        outpost_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='outpostArn']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        local_address: Core::XMLValue.string(node.xpath_node("*[local-name()='localAddress']")),
        peer_address: Core::XMLValue.string(node.xpath_node("*[local-name()='peerAddress']")),
        peer_bgp_asn: Core::XMLValue.i64(node.xpath_node("*[local-name()='peerBgpAsn']")),
        vlan: Core::XMLValue.i32(node.xpath_node("*[local-name()='vlan']")),
        outpost_lag_id: Core::XMLValue.string(node.xpath_node("*[local-name()='outpostLagId']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        configuration_state: (n = node.xpath_node("*[local-name()='configurationState']")) ? AEC::ServiceLinkVirtualInterfaceConfigurationState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @service_link_virtual_interface_arn
        raise Core::ValidationError.new("ServiceLinkVirtualInterfaceArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ServiceLinkVirtualInterfaceArn length must be <= 1283") if value.size > 1283
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@service_link_virtual_interface_id, @service_link_virtual_interface_arn, @outpost_id, @outpost_arn, @owner_id, @local_address, @peer_address, @peer_bgp_asn, @vlan, @outpost_lag_id, @tags, @configuration_state)
  end
end
