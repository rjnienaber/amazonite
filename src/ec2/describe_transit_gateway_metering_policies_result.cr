private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeTransitGatewayMeteringPoliciesResult
    # Information about the transit gateway metering policies.
    property transit_gateway_metering_policies : Array(TransitGatewayMeteringPolicy) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @transit_gateway_metering_policies : Array(TransitGatewayMeteringPolicy) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@transit_gateway_metering_policies || [] of TransitGatewayMeteringPolicy).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TransitGatewayMeteringPolicies.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_metering_policies: node.xpath_nodes("*[local-name()='transitGatewayMeteringPolicies']/*[local-name()='item']").map { |n| TransitGatewayMeteringPolicy.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @transit_gateway_metering_policies
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@transit_gateway_metering_policies, @next_token)
  end
end
