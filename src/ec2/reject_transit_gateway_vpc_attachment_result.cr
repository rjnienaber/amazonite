private alias Core = Amazonite::Core

module Amazonite::EC2
  class RejectTransitGatewayVpcAttachmentResult
    # Information about the attachment.
    property transit_gateway_vpc_attachment : TransitGatewayVpcAttachment | Nil

    def initialize(
      @transit_gateway_vpc_attachment : TransitGatewayVpcAttachment | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_vpc_attachment
        params.concat(value.to_query_params("#{prefix}TransitGatewayVpcAttachment."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_vpc_attachment: node.xpath_node("*[local-name()='transitGatewayVpcAttachment']").try { |n| TransitGatewayVpcAttachment.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @transit_gateway_vpc_attachment
        value.validate!
      end
    end

    def_equals_and_hash(@transit_gateway_vpc_attachment)
  end
end
