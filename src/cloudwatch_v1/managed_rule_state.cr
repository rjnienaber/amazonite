module Amazonite::CloudWatchV1
  # The status of a managed Contributor Insights rule.
  class ManagedRuleState
    include JSON::Serializable

    # The name of the Contributor Insights rule that contains data for the specified Amazon Web
    # Services resource.
    @[JSON::Field(key: "RuleName")]
    property rule_name : String

    # Indicates whether the rule is enabled or disabled.
    @[JSON::Field(key: "State")]
    property state : String

    def initialize(
      @rule_name : String,
      @state : String,
    )
    end

    def_equals_and_hash(@rule_name, @state)
  end
end
