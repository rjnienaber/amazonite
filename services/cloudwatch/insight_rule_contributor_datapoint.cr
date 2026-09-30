private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  # One data point related to one contributor.
  #
  # For more information, see
  # [GetInsightRuleReport](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetInsightRuleReport.html)
  # and
  # [InsightRuleContributor](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_InsightRuleContributor.html).
  class InsightRuleContributorDatapoint
    include JSON::Serializable

    # The timestamp of the data point.
    @[JSON::Field(key: "Timestamp", converter: Core::AWSEpochConverter)]
    property timestamp : Time

    # The approximate value that this contributor added during this timestamp.
    @[JSON::Field(key: "ApproximateValue")]
    property approximate_value : Float64

    def initialize(
      @timestamp : Time,
      @approximate_value : Float64,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@timestamp, @approximate_value)
  end
end
