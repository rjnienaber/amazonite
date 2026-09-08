private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateNatGatewayResult
    # Unique, case-sensitive identifier to ensure the idempotency of the request. Only returned if a
    # client token was provided in the request.
    property client_token : String | Nil

    # Information about the NAT gateway.
    property nat_gateway : NatGateway | Nil

    def initialize(
      @client_token : String | Nil = nil,
      @nat_gateway : NatGateway | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @nat_gateway
        params.concat(value.to_query_params("#{prefix}NatGateway."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='clientToken']")),
        nat_gateway: node.xpath_node("*[local-name()='natGateway']").try { |n| NatGateway.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @nat_gateway
        value.validate!
      end
    end

    def_equals_and_hash(@client_token, @nat_gateway)
  end
end
