private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyTransitGatewayPolicyTableEntryResult
    # Describes a transit gateway policy table entry
    property transit_gateway_policy_table_entry : TransitGatewayPolicyTableEntry | Nil

    def initialize(
      @transit_gateway_policy_table_entry : TransitGatewayPolicyTableEntry | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_policy_table_entry
        params.concat(value.to_query_params("#{prefix}TransitGatewayPolicyTableEntry."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_policy_table_entry: node.xpath_node("*[local-name()='transitGatewayPolicyTableEntry']").try { |n| TransitGatewayPolicyTableEntry.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @transit_gateway_policy_table_entry
        value.validate!
      end
    end

    def_equals_and_hash(@transit_gateway_policy_table_entry)
  end
end
