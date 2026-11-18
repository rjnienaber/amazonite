private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateTransitGatewayNetworkFunctionAttachmentResult
    # Information about the network function attachment.
    property transit_gateway_network_function_attachment : TransitGatewayNetworkFunctionAttachment | Nil

    def initialize(
      @transit_gateway_network_function_attachment : TransitGatewayNetworkFunctionAttachment | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_network_function_attachment
        params.concat(value.to_query_params("#{prefix}TransitGatewayNetworkFunctionAttachment."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_network_function_attachment: node.xpath_node("*[local-name()='transitGatewayNetworkFunctionAttachment']").try { |n| TransitGatewayNetworkFunctionAttachment.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @transit_gateway_network_function_attachment
        value.validate!
      end
    end

    def_equals_and_hash(@transit_gateway_network_function_attachment)
  end
end
