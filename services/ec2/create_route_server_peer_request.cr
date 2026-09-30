private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateRouteServerPeerRequest
    # The ID of the route server endpoint for which to create a peer.
    property route_server_endpoint_id : String

    # The IPv4 address of the peer device.
    property peer_address : String

    # The BGP options for the peer, including ASN (Autonomous System Number) and BFD (Bidrectional
    # Forwarding Detection) settings.
    property bgp_options : RouteServerBgpOptionsRequest

    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The tags to apply to the route server peer during creation.
    property tag_specifications : Array(TagSpecification) | Nil

    def initialize(
      @route_server_endpoint_id : String,
      @peer_address : String,
      @bgp_options : RouteServerBgpOptionsRequest,
      @dry_run : Bool | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}RouteServerEndpointId", @route_server_endpoint_id}

      params << {"#{prefix}PeerAddress", @peer_address}

      params.concat(@bgp_options.to_query_params("#{prefix}BgpOptions."))

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        route_server_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='RouteServerEndpointId']")).not_nil!,
        peer_address: Core::XMLValue.string(node.xpath_node("*[local-name()='PeerAddress']")).not_nil!,
        bgp_options: node.xpath_node("*[local-name()='BgpOptions']").try { |n| RouteServerBgpOptionsRequest.from_xml(n) }.not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @bgp_options
        value.validate!
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@route_server_endpoint_id, @peer_address, @bgp_options, @dry_run, @tag_specifications)
  end
end
