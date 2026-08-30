module Amazonite::CloudWatchV1
  class ListManagedInsightRulesOutput
    include JSON::Serializable

    # The managed rules that are available for the specified Amazon Web Services resource.
    @[JSON::Field(key: "ManagedRules")]
    property managed_rules : Array(ManagedRuleDescription) | Nil

    # Include this value to get the next set of rules if the value was returned by the previous
    # operation.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @managed_rules : Array(ManagedRuleDescription) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
