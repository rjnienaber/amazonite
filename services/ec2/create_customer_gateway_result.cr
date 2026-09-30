private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output of CreateCustomerGateway.
  class CreateCustomerGatewayResult
    # Information about the customer gateway.
    property customer_gateway : CustomerGateway | Nil

    def initialize(
      @customer_gateway : CustomerGateway | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @customer_gateway
        params.concat(value.to_query_params("#{prefix}CustomerGateway."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        customer_gateway: node.xpath_node("*[local-name()='customerGateway']").try { |n| CustomerGateway.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @customer_gateway
        value.validate!
      end
    end

    def_equals_and_hash(@customer_gateway)
  end
end
