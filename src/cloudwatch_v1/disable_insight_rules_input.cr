module Amazonite::CloudWatchV1
  class DisableInsightRulesInput
    include JSON::Serializable

    @[JSON::Field(key: "RuleNames")]
    property rule_names : Array(String) = [] of String

    def initialize(
      @rule_names : Array(String),
    )
    end
  end
end
