private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an entry in a transit gateway metering policy.
  class TransitGatewayMeteringPolicyEntry
    # The rule number of the metering policy entry.
    property policy_rule_number : String | Nil

    # The Amazon Web Services account ID to which the metered traffic is attributed.
    property metered_account : TransitGatewayMeteringPayerType | Nil

    # The state of the metering policy entry.
    property state : TransitGatewayMeteringPolicyEntryState | Nil

    # The date and time when the metering policy entry was last updated.
    property updated_at : Time | Nil

    # The date and time when the metering policy entry update becomes effective.
    property update_effective_at : Time | Nil

    # The metering policy rule that defines traffic matching criteria.
    property metering_policy_rule : TransitGatewayMeteringPolicyRule | Nil

    def initialize(
      @policy_rule_number : String | Nil = nil,
      @metered_account : TransitGatewayMeteringPayerType | Nil = nil,
      @state : TransitGatewayMeteringPolicyEntryState | Nil = nil,
      @updated_at : Time | Nil = nil,
      @update_effective_at : Time | Nil = nil,
      @metering_policy_rule : TransitGatewayMeteringPolicyRule | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @policy_rule_number
        params << {"#{prefix}PolicyRuleNumber", value}
      end

      if value = @metered_account
        params << {"#{prefix}MeteredAccount", value.to_json_object_key}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @updated_at
        params << {"#{prefix}UpdatedAt", Core::QueryValue.time(value)}
      end

      if value = @update_effective_at
        params << {"#{prefix}UpdateEffectiveAt", Core::QueryValue.time(value)}
      end

      if value = @metering_policy_rule
        params.concat(value.to_query_params("#{prefix}MeteringPolicyRule."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_rule_number: Core::XMLValue.string(node.xpath_node("*[local-name()='policyRuleNumber']")),
        metered_account: (n = node.xpath_node("*[local-name()='meteredAccount']")) ? AEC::TransitGatewayMeteringPayerType.from_json_object_key?(n.content) : nil,
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::TransitGatewayMeteringPolicyEntryState.from_json_object_key?(n.content) : nil,
        updated_at: Core::XMLValue.time(node.xpath_node("*[local-name()='updatedAt']")),
        update_effective_at: Core::XMLValue.time(node.xpath_node("*[local-name()='updateEffectiveAt']")),
        metering_policy_rule: node.xpath_node("*[local-name()='meteringPolicyRule']").try { |n| TransitGatewayMeteringPolicyRule.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @metering_policy_rule
        value.validate!
      end
    end

    def_equals_and_hash(@policy_rule_number, @metered_account, @state, @updated_at, @update_effective_at, @metering_policy_rule)
  end
end
