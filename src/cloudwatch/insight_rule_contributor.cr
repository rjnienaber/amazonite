private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  # One of the unique contributors found by a Contributor Insights rule. If the rule contains
  # multiple keys, then a unique contributor is a unique combination of values from all the keys in
  # the rule.
  #
  # If the rule contains a single key, then each unique contributor is each unique value for this
  # key.
  #
  # For more information, see
  # [GetInsightRuleReport](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetInsightRuleReport.html).
  class InsightRuleContributor
    include JSON::Serializable

    # One of the log entry field keywords that is used to define contributors for this rule.
    @[JSON::Field(key: "Keys")]
    property keys : Array(String) = [] of String

    # An approximation of the aggregate value that comes from this contributor.
    @[JSON::Field(key: "ApproximateAggregateValue")]
    property approximate_aggregate_value : Float64

    # An array of the data points where this contributor is present. Only the data points when this
    # contributor appeared are included in the array.
    @[JSON::Field(key: "Datapoints")]
    property datapoints : Array(InsightRuleContributorDatapoint) = [] of InsightRuleContributorDatapoint

    def initialize(
      @keys : Array(String),
      @approximate_aggregate_value : Float64,
      @datapoints : Array(InsightRuleContributorDatapoint),
    )
    end

    def validate! : Nil
      if value = @datapoints
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@keys, @approximate_aggregate_value, @datapoints)
  end
end
