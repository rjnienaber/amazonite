private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteCarrierGatewayResult
    # Information about the carrier gateway.
    property carrier_gateway : CarrierGateway | Nil

    def initialize(
      @carrier_gateway : CarrierGateway | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @carrier_gateway
        params.concat(value.to_query_params("#{prefix}CarrierGateway."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        carrier_gateway: node.xpath_node("*[local-name()='carrierGateway']").try { |n| CarrierGateway.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @carrier_gateway
        value.validate!
      end
    end

    def_equals_and_hash(@carrier_gateway)
  end
end
