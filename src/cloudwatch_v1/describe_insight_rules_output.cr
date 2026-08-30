module Amazonite::CloudWatchV1
  class DescribeInsightRulesOutput
    include JSON::Serializable

    # If this parameter is present, it is a token that marks the start of the next batch of returned
    # results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The rules returned by the operation.
    @[JSON::Field(key: "InsightRules")]
    property insight_rules : Array(InsightRule) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @insight_rules : Array(InsightRule) | Nil = nil,
    )
    end
  end
end
