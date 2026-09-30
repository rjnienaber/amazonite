private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateTransitGatewayMeteringPolicyEntryResult
    # Information about the created transit gateway metering policy entry.
    property transit_gateway_metering_policy_entry : TransitGatewayMeteringPolicyEntry | Nil

    def initialize(
      @transit_gateway_metering_policy_entry : TransitGatewayMeteringPolicyEntry | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_metering_policy_entry
        params.concat(value.to_query_params("#{prefix}TransitGatewayMeteringPolicyEntry."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_metering_policy_entry: node.xpath_node("*[local-name()='transitGatewayMeteringPolicyEntry']").try { |n| TransitGatewayMeteringPolicyEntry.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @transit_gateway_metering_policy_entry
        value.validate!
      end
    end

    def_equals_and_hash(@transit_gateway_metering_policy_entry)
  end
end
