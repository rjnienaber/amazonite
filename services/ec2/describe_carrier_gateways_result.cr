private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeCarrierGatewaysResult
    # Information about the carrier gateway.
    property carrier_gateways : Array(CarrierGateway) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @carrier_gateways : Array(CarrierGateway) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@carrier_gateways || [] of CarrierGateway).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}CarrierGatewaySet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        carrier_gateways: node.xpath_nodes("*[local-name()='carrierGatewaySet']/*[local-name()='item']").map { |n| CarrierGateway.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @carrier_gateways
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@carrier_gateways, @next_token)
  end
end
