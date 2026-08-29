module Amazonite::CloudWatchV1
  class PutInsightRuleInput
    include JSON::Serializable

    @[JSON::Field(key: "RuleName")]
    property rule_name : String

    @[JSON::Field(key: "RuleState")]
    property rule_state : String | Nil

    @[JSON::Field(key: "RuleDefinition")]
    property rule_definition : String

    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    @[JSON::Field(key: "ApplyOnTransformedLogs")]
    property apply_on_transformed_logs : Bool | Nil

    def initialize(
      @rule_name : String,
      @rule_definition : String,
      @rule_state : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @apply_on_transformed_logs : Bool | Nil = nil,
    )
    end
  end
end
