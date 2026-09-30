private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateTransitGatewayConnectPeerRequest
    # The ID of the Connect attachment.
    property transit_gateway_attachment_id : String

    # The peer IP address (GRE outer IP address) on the transit gateway side of the Connect peer,
    # which must be specified from a transit gateway CIDR block. If not specified, Amazon
    # automatically assigns the first available IP address from the transit gateway CIDR block.
    property transit_gateway_address : String | Nil

    # The peer IP address (GRE outer IP address) on the appliance side of the Connect peer.
    property peer_address : String

    # The BGP options for the Connect peer.
    property bgp_options : TransitGatewayConnectRequestBgpOptions | Nil

    # The range of inside IP addresses that are used for BGP peering. You must specify a size /29 IPv4
    # CIDR block from the `169.254.0.0/16` range. The first address from the range must be configured
    # on the appliance as the BGP IP address. You can also optionally specify a size /125 IPv6 CIDR
    # block from the `fd00::/8` range.
    property inside_cidr_blocks : Array(String) = [] of String

    # The tags to apply to the Connect peer.
    property tag_specifications : Array(TagSpecification) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @transit_gateway_attachment_id : String,
      @peer_address : String,
      @inside_cidr_blocks : Array(String),
      @transit_gateway_address : String | Nil = nil,
      @bgp_options : TransitGatewayConnectRequestBgpOptions | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TransitGatewayAttachmentId", @transit_gateway_attachment_id}

      if value = @transit_gateway_address
        params << {"#{prefix}TransitGatewayAddress", value}
      end

      params << {"#{prefix}PeerAddress", @peer_address}

      if value = @bgp_options
        params.concat(value.to_query_params("#{prefix}BgpOptions."))
      end

      @inside_cidr_blocks.each_with_index(1) do |item, i|
        params << {"#{prefix}InsideCidrBlocks.#{i}", item}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayAttachmentId']")).not_nil!,
        transit_gateway_address: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayAddress']")),
        peer_address: Core::XMLValue.string(node.xpath_node("*[local-name()='PeerAddress']")).not_nil!,
        bgp_options: node.xpath_node("*[local-name()='BgpOptions']").try { |n| TransitGatewayConnectRequestBgpOptions.from_xml(n) },
        inside_cidr_blocks: node.xpath_nodes("*[local-name()='InsideCidrBlocks']/*[local-name()='item']").map { |n| n.content },
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
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

    def_equals_and_hash(@transit_gateway_attachment_id, @transit_gateway_address, @peer_address, @bgp_options, @inside_cidr_blocks, @tag_specifications, @dry_run)
  end
end
