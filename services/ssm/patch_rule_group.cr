private alias Core = Amazonite::Core

module Amazonite::Ssm
  # A set of rules defining the approval rules for a patch baseline.
  class PatchRuleGroup
    include JSON::Serializable

    # The rules that make up the rule group.
    @[JSON::Field(key: "PatchRules")]
    property patch_rules : Array(PatchRule) = [] of PatchRule

    def initialize(
      @patch_rules : Array(PatchRule),
    )
    end

    def validate! : Nil
      if value = @patch_rules
        raise Core::ValidationError.new("PatchRules must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("PatchRules must have at most 10 item(s)") if value.size > 10
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@patch_rules)
  end
end
