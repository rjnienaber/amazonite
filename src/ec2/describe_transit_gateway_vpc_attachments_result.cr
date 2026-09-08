private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeTransitGatewayVpcAttachmentsResult
    # Information about the VPC attachments.
    property transit_gateway_vpc_attachments : Array(TransitGatewayVpcAttachment) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @transit_gateway_vpc_attachments : Array(TransitGatewayVpcAttachment) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@transit_gateway_vpc_attachments || [] of TransitGatewayVpcAttachment).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TransitGatewayVpcAttachments.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_vpc_attachments: node.xpath_nodes("*[local-name()='transitGatewayVpcAttachments']/*[local-name()='item']").map { |n| TransitGatewayVpcAttachment.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @transit_gateway_vpc_attachments
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@transit_gateway_vpc_attachments, @next_token)
  end
end
