module Amazonite::CloudWatchV1
  class ListManagedInsightRulesOutput
    include JSON::Serializable

    @[JSON::Field(key: "ManagedRules")]
    property managed_rules : Array(ManagedRuleDescription) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @managed_rules : Array(ManagedRuleDescription) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
