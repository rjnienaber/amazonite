private alias Core = Amazonite::Core

module Amazonite::CloudWatch
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

    def validate! : Nil
      if value = @insight_rules
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @insight_rules)
  end
end
