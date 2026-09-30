private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateTransitGatewayVpcAttachmentRequest
    # The ID of the transit gateway.
    property transit_gateway_id : String

    # The ID of the VPC.
    property vpc_id : String

    # The IDs of one or more subnets. You can specify only one subnet per Availability Zone. You must
    # specify at least one subnet, but we recommend that you specify two subnets for better
    # availability. The transit gateway uses one IP address from each specified subnet.
    property subnet_ids : Array(String) = [] of String

    # The VPC attachment options.
    property options : CreateTransitGatewayVpcAttachmentRequestOptions | Nil

    # The tags to apply to the VPC attachment.
    property tag_specifications : Array(TagSpecification) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @transit_gateway_id : String,
      @vpc_id : String,
      @subnet_ids : Array(String),
      @options : CreateTransitGatewayVpcAttachmentRequestOptions | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TransitGatewayId", @transit_gateway_id}

      params << {"#{prefix}VpcId", @vpc_id}

      @subnet_ids.each_with_index(1) do |item, i|
        params << {"#{prefix}SubnetIds.#{i}", item}
      end

      if value = @options
        params.concat(value.to_query_params("#{prefix}Options."))
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecifications.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayId']")).not_nil!,
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpcId']")).not_nil!,
        subnet_ids: node.xpath_nodes("*[local-name()='SubnetIds']/*[local-name()='item']").map { |n| n.content },
        options: node.xpath_node("*[local-name()='Options']").try { |n| CreateTransitGatewayVpcAttachmentRequestOptions.from_xml(n) },
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecifications']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
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

    def_equals_and_hash(@transit_gateway_id, @vpc_id, @subnet_ids, @options, @tag_specifications, @dry_run)
  end
end
