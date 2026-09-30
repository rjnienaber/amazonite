private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateEgressOnlyInternetGatewayResult
    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
    property client_token : String | Nil

    # Information about the egress-only internet gateway.
    property egress_only_internet_gateway : EgressOnlyInternetGateway | Nil

    def initialize(
      @client_token : String | Nil = nil,
      @egress_only_internet_gateway : EgressOnlyInternetGateway | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @egress_only_internet_gateway
        params.concat(value.to_query_params("#{prefix}EgressOnlyInternetGateway."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='clientToken']")),
        egress_only_internet_gateway: node.xpath_node("*[local-name()='egressOnlyInternetGateway']").try { |n| EgressOnlyInternetGateway.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @egress_only_internet_gateway
        value.validate!
      end
    end

    def_equals_and_hash(@client_token, @egress_only_internet_gateway)
  end
end
