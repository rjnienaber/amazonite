private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteTransitGatewayPrefixListReferenceResult
    # Information about the deleted prefix list reference.
    property transit_gateway_prefix_list_reference : TransitGatewayPrefixListReference | Nil

    def initialize(
      @transit_gateway_prefix_list_reference : TransitGatewayPrefixListReference | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_prefix_list_reference
        params.concat(value.to_query_params("#{prefix}TransitGatewayPrefixListReference."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_prefix_list_reference: node.xpath_node("*[local-name()='transitGatewayPrefixListReference']").try { |n| TransitGatewayPrefixListReference.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @transit_gateway_prefix_list_reference
        value.validate!
      end
    end

    def_equals_and_hash(@transit_gateway_prefix_list_reference)
  end
end
