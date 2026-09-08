private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteTransitGatewayMeteringPolicyResult
    # Information about the deleted transit gateway metering policy.
    property transit_gateway_metering_policy : TransitGatewayMeteringPolicy | Nil

    def initialize(
      @transit_gateway_metering_policy : TransitGatewayMeteringPolicy | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_metering_policy
        params.concat(value.to_query_params("#{prefix}TransitGatewayMeteringPolicy."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_metering_policy: node.xpath_node("*[local-name()='transitGatewayMeteringPolicy']").try { |n| TransitGatewayMeteringPolicy.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @transit_gateway_metering_policy
        value.validate!
      end
    end

    def_equals_and_hash(@transit_gateway_metering_policy)
  end
end
