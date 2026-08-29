module Amazonite::CloudWatchV1
  class InsightRuleContributor
    include JSON::Serializable

    @[JSON::Field(key: "Keys")]
    property keys : Array(String) = [] of String

    @[JSON::Field(key: "ApproximateAggregateValue")]
    property approximate_aggregate_value : Float64

    @[JSON::Field(key: "Datapoints")]
    property datapoints : Array(InsightRuleContributorDatapoint) = [] of InsightRuleContributorDatapoint

    def initialize(
      @keys : Array(String),
      @approximate_aggregate_value : Float64,
      @datapoints : Array(InsightRuleContributorDatapoint),
    )
    end
  end
end
