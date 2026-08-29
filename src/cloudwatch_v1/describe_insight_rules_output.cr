module Amazonite::CloudWatchV1
  class DescribeInsightRulesOutput
    include JSON::Serializable

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "InsightRules")]
    property insight_rules : Array(InsightRule) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @insight_rules : Array(InsightRule) | Nil = nil,
    )
    end
  end
end
