private alias Core = Amazonite::Core

module Amazonite::EC2
  class AcceptVpcEndpointConnectionsRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the VPC endpoint service.
    property service_id : String

    # The IDs of the interface VPC endpoints.
    #
    # You must specify either `VpcEndpointIds` or `TransitGatewayAttachmentIds`, but not both.
    property vpc_endpoint_ids : Array(String) = [] of String

    # The IDs of the transit gateway attachments to accept. This parameter is supported only for
    # Gateway Load Balancer endpoint services.
    #
    # You must specify either `VpcEndpointIds` or `TransitGatewayAttachmentIds`, but not both.
    property transit_gateway_attachment_ids : Array(String) | Nil

    def initialize(
      @service_id : String,
      @vpc_endpoint_ids : Array(String),
      @dry_run : Bool | Nil = nil,
      @transit_gateway_attachment_ids : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}ServiceId", @service_id}

      @vpc_endpoint_ids.each_with_index(1) do |item, i|
        params << {"#{prefix}VpcEndpointId.#{i}", item}
      end

      (@transit_gateway_attachment_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}TransitGatewayAttachmentId.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        service_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceId']")).not_nil!,
        vpc_endpoint_ids: node.xpath_nodes("*[local-name()='VpcEndpointId']/*[local-name()='item']").map { |n| n.content },
        transit_gateway_attachment_ids: node.xpath_nodes("*[local-name()='TransitGatewayAttachmentId']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
      if value = @transit_gateway_attachment_ids
        raise Core::ValidationError.new("TransitGatewayAttachmentIds must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("TransitGatewayAttachmentIds must have at most 50 item(s)") if value.size > 50
      end
    end

    def_equals_and_hash(@dry_run, @service_id, @vpc_endpoint_ids, @transit_gateway_attachment_ids)
  end
end
