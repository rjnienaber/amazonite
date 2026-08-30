module Amazonite::SsmV1
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

    def_equals_and_hash(@patch_rules)
  end
end
