private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyTransitGatewayVpcAttachmentRequest
    # The ID of the attachment.
    property transit_gateway_attachment_id : String

    # The IDs of one or more subnets to add. You can specify at most one subnet per Availability Zone.
    property add_subnet_ids : Array(String) | Nil

    # The IDs of one or more subnets to remove.
    property remove_subnet_ids : Array(String) | Nil

    # The new VPC attachment options.
    property options : ModifyTransitGatewayVpcAttachmentRequestOptions | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @transit_gateway_attachment_id : String,
      @add_subnet_ids : Array(String) | Nil = nil,
      @remove_subnet_ids : Array(String) | Nil = nil,
      @options : ModifyTransitGatewayVpcAttachmentRequestOptions | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TransitGatewayAttachmentId", @transit_gateway_attachment_id}

      (@add_subnet_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AddSubnetIds.#{i}", item}
      end

      (@remove_subnet_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}RemoveSubnetIds.#{i}", item}
      end

      if value = @options
        params.concat(value.to_query_params("#{prefix}Options."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayAttachmentId']")).not_nil!,
        add_subnet_ids: node.xpath_nodes("*[local-name()='AddSubnetIds']/*[local-name()='item']").map { |n| n.content },
        remove_subnet_ids: node.xpath_nodes("*[local-name()='RemoveSubnetIds']/*[local-name()='item']").map { |n| n.content },
        options: node.xpath_node("*[local-name()='Options']").try { |n| ModifyTransitGatewayVpcAttachmentRequestOptions.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @options
        value.validate!
      end
    end

    def_equals_and_hash(@transit_gateway_attachment_id, @add_subnet_ids, @remove_subnet_ids, @options, @dry_run)
  end
end
