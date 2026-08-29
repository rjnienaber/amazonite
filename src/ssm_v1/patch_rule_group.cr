module Amazonite::SsmV1
  class PatchRuleGroup
    include JSON::Serializable

    @[JSON::Field(key: "PatchRules")]
    property patch_rules : Array(PatchRule) = [] of PatchRule

    def initialize(
      @patch_rules : Array(PatchRule),
    )
    end
  end
end
