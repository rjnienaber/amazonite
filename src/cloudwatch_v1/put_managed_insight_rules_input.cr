module Amazonite::CloudWatchV1
  class PutManagedInsightRulesInput
    include JSON::Serializable

    @[JSON::Field(key: "ManagedRules")]
    property managed_rules : Array(ManagedRule) = [] of ManagedRule

    def initialize(
      @managed_rules : Array(ManagedRule),
    )
    end
  end
end
