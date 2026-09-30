private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateLocalGatewayVirtualInterfaceRequest
    # The ID of the local gateway virtual interface group.
    property local_gateway_virtual_interface_group_id : String

    # References the Link Aggregation Group (LAG) that connects the Outpost to on-premises network
    # devices.
    property outpost_lag_id : String

    # The virtual local area network (VLAN) used for the local gateway virtual interface.
    property vlan : Int32

    # The IP address assigned to the local gateway virtual interface on the Outpost side. Only IPv4 is
    # supported.
    property local_address : String

    # The peer IP address for the local gateway virtual interface. Only IPv4 is supported.
    property peer_address : String

    # The Autonomous System Number (ASN) of the Border Gateway Protocol (BGP) peer.
    property peer_bgp_asn : Int32 | Nil

    # The tags to apply to a resource when the local gateway virtual interface is being created.
    property tag_specifications : Array(TagSpecification) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The extended 32-bit ASN of the BGP peer for use with larger ASN values.
    property peer_bgp_asn_extended : Int64 | Nil

    def initialize(
      @local_gateway_virtual_interface_group_id : String,
      @outpost_lag_id : String,
      @vlan : Int32,
      @local_address : String,
      @peer_address : String,
      @peer_bgp_asn : Int32 | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @peer_bgp_asn_extended : Int64 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}LocalGatewayVirtualInterfaceGroupId", @local_gateway_virtual_interface_group_id}

      params << {"#{prefix}OutpostLagId", @outpost_lag_id}

      params << {"#{prefix}Vlan", @vlan.to_s}

      params << {"#{prefix}LocalAddress", @local_address}

      params << {"#{prefix}PeerAddress", @peer_address}

      if value = @peer_bgp_asn
        params << {"#{prefix}PeerBgpAsn", value.to_s}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @peer_bgp_asn_extended
        params << {"#{prefix}PeerBgpAsnExtended", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        local_gateway_virtual_interface_group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LocalGatewayVirtualInterfaceGroupId']")).not_nil!,
        outpost_lag_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OutpostLagId']")).not_nil!,
        vlan: Core::XMLValue.i32(node.xpath_node("*[local-name()='Vlan']")).not_nil!,
        local_address: Core::XMLValue.string(node.xpath_node("*[local-name()='LocalAddress']")).not_nil!,
        peer_address: Core::XMLValue.string(node.xpath_node("*[local-name()='PeerAddress']")).not_nil!,
        peer_bgp_asn: Core::XMLValue.i32(node.xpath_node("*[local-name()='PeerBgpAsn']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        peer_bgp_asn_extended: Core::XMLValue.i64(node.xpath_node("*[local-name()='PeerBgpAsnExtended']")),
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@local_gateway_virtual_interface_group_id, @outpost_lag_id, @vlan, @local_address, @peer_address, @peer_bgp_asn, @tag_specifications, @dry_run, @peer_bgp_asn_extended)
  end
end
