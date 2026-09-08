private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteTransitGatewayMeteringPolicyEntryRequest
    # The ID of the transit gateway metering policy containing the entry to delete.
    property transit_gateway_metering_policy_id : String

    # The rule number of the metering policy entry to delete.
    property policy_rule_number : Int32

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @transit_gateway_metering_policy_id : String,
      @policy_rule_number : Int32,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TransitGatewayMeteringPolicyId", @transit_gateway_metering_policy_id}

      params << {"#{prefix}PolicyRuleNumber", @policy_rule_number.to_s}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_metering_policy_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayMeteringPolicyId']")).not_nil!,
        policy_rule_number: Core::XMLValue.i32(node.xpath_node("*[local-name()='PolicyRuleNumber']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@transit_gateway_metering_policy_id, @policy_rule_number, @dry_run)
  end
end
