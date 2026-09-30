private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateTransitGatewayPeeringAttachmentResult
    # The transit gateway peering attachment.
    property transit_gateway_peering_attachment : TransitGatewayPeeringAttachment | Nil

    def initialize(
      @transit_gateway_peering_attachment : TransitGatewayPeeringAttachment | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_peering_attachment
        params.concat(value.to_query_params("#{prefix}TransitGatewayPeeringAttachment."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_peering_attachment: node.xpath_node("*[local-name()='transitGatewayPeeringAttachment']").try { |n| TransitGatewayPeeringAttachment.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @transit_gateway_peering_attachment
        value.validate!
      end
    end

    def_equals_and_hash(@transit_gateway_peering_attachment)
  end
end
