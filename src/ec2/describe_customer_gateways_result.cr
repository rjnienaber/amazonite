private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output of DescribeCustomerGateways.
  class DescribeCustomerGatewaysResult
    # Information about one or more customer gateways.
    property customer_gateways : Array(CustomerGateway) | Nil

    def initialize(
      @customer_gateways : Array(CustomerGateway) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@customer_gateways || [] of CustomerGateway).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}CustomerGatewaySet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        customer_gateways: node.xpath_nodes("*[local-name()='customerGatewaySet']/*[local-name()='item']").map { |n| CustomerGateway.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @customer_gateways
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@customer_gateways)
  end
end
