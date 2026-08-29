module Amazonite::CloudWatchV1
  class ManagedRuleState
    include JSON::Serializable

    @[JSON::Field(key: "RuleName")]
    property rule_name : String

    @[JSON::Field(key: "State")]
    property state : String

    def initialize(
      @rule_name : String,
      @state : String,
    )
    end
  end
end
