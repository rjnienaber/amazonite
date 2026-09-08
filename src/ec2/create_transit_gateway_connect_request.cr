private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateTransitGatewayConnectRequest
    # The ID of the transit gateway attachment. You can specify a VPC attachment or Amazon Web
    # Services Direct Connect attachment.
    property transport_transit_gateway_attachment_id : String

    # The Connect attachment options.
    property options : CreateTransitGatewayConnectRequestOptions

    # The tags to apply to the Connect attachment.
    property tag_specifications : Array(TagSpecification) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @transport_transit_gateway_attachment_id : String,
      @options : CreateTransitGatewayConnectRequestOptions,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TransportTransitGatewayAttachmentId", @transport_transit_gateway_attachment_id}

      params.concat(@options.to_query_params("#{prefix}Options."))

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
        transport_transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransportTransitGatewayAttachmentId']")).not_nil!,
        options: node.xpath_node("*[local-name()='Options']").try { |n| CreateTransitGatewayConnectRequestOptions.from_xml(n) }.not_nil!,
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

    def_equals_and_hash(@transport_transit_gateway_attachment_id, @options, @tag_specifications, @dry_run)
  end
end
