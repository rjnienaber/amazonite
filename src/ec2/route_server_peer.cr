private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a BGP peer configuration for a route server endpoint.
  #
  # A route server peer is a session between a route server endpoint and the device deployed in
  # Amazon Web Services (such as a firewall appliance or other network security function running on
  # an EC2 instance). The device must meet these requirements:
  #
  # - Have an elastic network interface in the VPC
  #
  # - Support BGP (Border Gateway Protocol)
  #
  # - Can initiate BGP sessions
  class RouteServerPeer
    # The unique identifier of the route server peer.
    property route_server_peer_id : String | Nil

    # The ID of the route server endpoint associated with this peer.
    property route_server_endpoint_id : String | Nil

    # The ID of the route server associated with this peer.
    property route_server_id : String | Nil

    # The ID of the VPC containing the route server peer.
    property vpc_id : String | Nil

    # The ID of the subnet containing the route server peer.
    property subnet_id : String | Nil

    # The current state of the route server peer.
    property state : RouteServerPeerState | Nil

    # The reason for any failure in peer creation or operation.
    property failure_reason : String | Nil

    # The ID of the Elastic network interface for the route server endpoint.
    property endpoint_eni_id : String | Nil

    # The IP address of the Elastic network interface for the route server endpoint.
    property endpoint_eni_address : String | Nil

    # The IPv4 address of the peer device.
    property peer_address : String | Nil

    # The BGP configuration options for this peer, including ASN (Autonomous System Number) and BFD
    # (Bidrectional Forwarding Detection) settings.
    property bgp_options : RouteServerBgpOptions | Nil

    # The current status of the BGP session with this peer.
    property bgp_status : RouteServerBgpStatus | Nil

    # The current status of the BFD session with this peer.
    property bfd_status : RouteServerBfdStatus | Nil

    # Any tags assigned to the route server peer.
    property tags : Array(Tag) | Nil

    def initialize(
      @route_server_peer_id : String | Nil = nil,
      @route_server_endpoint_id : String | Nil = nil,
      @route_server_id : String | Nil = nil,
      @vpc_id : String | Nil = nil,
      @subnet_id : String | Nil = nil,
      @state : RouteServerPeerState | Nil = nil,
      @failure_reason : String | Nil = nil,
      @endpoint_eni_id : String | Nil = nil,
      @endpoint_eni_address : String | Nil = nil,
      @peer_address : String | Nil = nil,
      @bgp_options : RouteServerBgpOptions | Nil = nil,
      @bgp_status : RouteServerBgpStatus | Nil = nil,
      @bfd_status : RouteServerBfdStatus | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @route_server_peer_id
        params << {"#{prefix}RouteServerPeerId", value}
      end

      if value = @route_server_endpoint_id
        params << {"#{prefix}RouteServerEndpointId", value}
      end

      if value = @route_server_id
        params << {"#{prefix}RouteServerId", value}
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @failure_reason
        params << {"#{prefix}FailureReason", value}
      end

      if value = @endpoint_eni_id
        params << {"#{prefix}EndpointEniId", value}
      end

      if value = @endpoint_eni_address
        params << {"#{prefix}EndpointEniAddress", value}
      end

      if value = @peer_address
        params << {"#{prefix}PeerAddress", value}
      end

      if value = @bgp_options
        params.concat(value.to_query_params("#{prefix}BgpOptions."))
      end

      if value = @bgp_status
        params.concat(value.to_query_params("#{prefix}BgpStatus."))
      end

      if value = @bfd_status
        params.concat(value.to_query_params("#{prefix}BfdStatus."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        route_server_peer_id: Core::XMLValue.string(node.xpath_node("*[local-name()='routeServerPeerId']")),
        route_server_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='routeServerEndpointId']")),
        route_server_id: Core::XMLValue.string(node.xpath_node("*[local-name()='routeServerId']")),
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::RouteServerPeerState.from_json_object_key?(n.content) : nil,
        failure_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='failureReason']")),
        endpoint_eni_id: Core::XMLValue.string(node.xpath_node("*[local-name()='endpointEniId']")),
        endpoint_eni_address: Core::XMLValue.string(node.xpath_node("*[local-name()='endpointEniAddress']")),
        peer_address: Core::XMLValue.string(node.xpath_node("*[local-name()='peerAddress']")),
        bgp_options: node.xpath_node("*[local-name()='bgpOptions']").try { |n| RouteServerBgpOptions.from_xml(n) },
        bgp_status: node.xpath_node("*[local-name()='bgpStatus']").try { |n| RouteServerBgpStatus.from_xml(n) },
        bfd_status: node.xpath_node("*[local-name()='bfdStatus']").try { |n| RouteServerBfdStatus.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @bgp_options
        value.validate!
      end

      if value = @bgp_status
        value.validate!
      end

      if value = @bfd_status
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@route_server_peer_id, @route_server_endpoint_id, @route_server_id, @vpc_id, @subnet_id, @state, @failure_reason, @endpoint_eni_id, @endpoint_eni_address, @peer_address, @bgp_options, @bgp_status, @bfd_status, @tags)
  end
end
