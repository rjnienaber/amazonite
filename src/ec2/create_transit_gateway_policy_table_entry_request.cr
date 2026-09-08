private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateTransitGatewayPolicyTableEntryRequest
    # The ID of the transit gateway policy table.
    property transit_gateway_policy_table_id : String

    # The rule number for the policy table entry. Lower rule numbers are evaluated first and take
    # precedence.
    property policy_rule_number : String

    # The matching criteria for the policy table entry.
    property policy_rule : TransitGatewayRequestPolicyRule | Nil

    # The ID of the transit gateway route table to use for traffic matching this rule.
    property target_route_table_id : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @transit_gateway_policy_table_id : String,
      @policy_rule_number : String,
      @target_route_table_id : String,
      @policy_rule : TransitGatewayRequestPolicyRule | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TransitGatewayPolicyTableId", @transit_gateway_policy_table_id}

      params << {"#{prefix}PolicyRuleNumber", @policy_rule_number}

      if value = @policy_rule
        params.concat(value.to_query_params("#{prefix}PolicyRule."))
      end

      params << {"#{prefix}TargetRouteTableId", @target_route_table_id}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_policy_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayPolicyTableId']")).not_nil!,
        policy_rule_number: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyRuleNumber']")).not_nil!,
        policy_rule: node.xpath_node("*[local-name()='PolicyRule']").try { |n| TransitGatewayRequestPolicyRule.from_xml(n) },
        target_route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TargetRouteTableId']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @policy_rule
        value.validate!
      end
    end

    def_equals_and_hash(@transit_gateway_policy_table_id, @policy_rule_number, @policy_rule, @target_route_table_id, @dry_run)
  end
end
