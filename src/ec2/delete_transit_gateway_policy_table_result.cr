private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteTransitGatewayPolicyTableResult
    # Provides details about the deleted transit gateway policy table.
    property transit_gateway_policy_table : TransitGatewayPolicyTable | Nil

    def initialize(
      @transit_gateway_policy_table : TransitGatewayPolicyTable | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_policy_table
        params.concat(value.to_query_params("#{prefix}TransitGatewayPolicyTable."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_policy_table: node.xpath_node("*[local-name()='transitGatewayPolicyTable']").try { |n| TransitGatewayPolicyTable.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @transit_gateway_policy_table
        value.validate!
      end
    end

    def_equals_and_hash(@transit_gateway_policy_table)
  end
end
