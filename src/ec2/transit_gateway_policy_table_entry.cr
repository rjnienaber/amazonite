private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a transit gateway policy table entry
  class TransitGatewayPolicyTableEntry
    # The rule number for the transit gateway policy table entry.
    property policy_rule_number : String | Nil

    # The policy rule associated with the transit gateway policy table.
    property policy_rule : TransitGatewayPolicyRule | Nil

    # The ID of the target route table.
    property target_route_table_id : String | Nil

    # The state of the transit gateway policy table entry.
    property state : TransitGatewayPolicyTableEntryState | Nil

    def initialize(
      @policy_rule_number : String | Nil = nil,
      @policy_rule : TransitGatewayPolicyRule | Nil = nil,
      @target_route_table_id : String | Nil = nil,
      @state : TransitGatewayPolicyTableEntryState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @policy_rule_number
        params << {"#{prefix}PolicyRuleNumber", value}
      end

      if value = @policy_rule
        params.concat(value.to_query_params("#{prefix}PolicyRule."))
      end

      if value = @target_route_table_id
        params << {"#{prefix}TargetRouteTableId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_rule_number: Core::XMLValue.string(node.xpath_node("*[local-name()='policyRuleNumber']")),
        policy_rule: node.xpath_node("*[local-name()='policyRule']").try { |n| TransitGatewayPolicyRule.from_xml(n) },
        target_route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='targetRouteTableId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::TransitGatewayPolicyTableEntryState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @policy_rule
        value.validate!
      end
    end

    def_equals_and_hash(@policy_rule_number, @policy_rule, @target_route_table_id, @state)
  end
end
