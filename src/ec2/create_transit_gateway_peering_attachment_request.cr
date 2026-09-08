private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateTransitGatewayPeeringAttachmentRequest
    # The ID of the transit gateway.
    property transit_gateway_id : String

    # The ID of the peer transit gateway with which to create the peering attachment.
    property peer_transit_gateway_id : String

    # The ID of the Amazon Web Services account that owns the peer transit gateway.
    property peer_account_id : String

    # The Region where the peer transit gateway is located.
    property peer_region : String

    # Requests a transit gateway peering attachment.
    property options : CreateTransitGatewayPeeringAttachmentRequestOptions | Nil

    # The tags to apply to the transit gateway peering attachment.
    property tag_specifications : Array(TagSpecification) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @transit_gateway_id : String,
      @peer_transit_gateway_id : String,
      @peer_account_id : String,
      @peer_region : String,
      @options : CreateTransitGatewayPeeringAttachmentRequestOptions | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TransitGatewayId", @transit_gateway_id}

      params << {"#{prefix}PeerTransitGatewayId", @peer_transit_gateway_id}

      params << {"#{prefix}PeerAccountId", @peer_account_id}

      params << {"#{prefix}PeerRegion", @peer_region}

      if value = @options
        params.concat(value.to_query_params("#{prefix}Options."))
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
        transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayId']")).not_nil!,
        peer_transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PeerTransitGatewayId']")).not_nil!,
        peer_account_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PeerAccountId']")).not_nil!,
        peer_region: Core::XMLValue.string(node.xpath_node("*[local-name()='PeerRegion']")).not_nil!,
        options: node.xpath_node("*[local-name()='Options']").try { |n| CreateTransitGatewayPeeringAttachmentRequestOptions.from_xml(n) },
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @options
        value.validate!
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@transit_gateway_id, @peer_transit_gateway_id, @peer_account_id, @peer_region, @options, @tag_specifications, @dry_run)
  end
end
