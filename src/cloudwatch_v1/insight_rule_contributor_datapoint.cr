private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class InsightRuleContributorDatapoint
    include JSON::Serializable

    @[JSON::Field(key: "Timestamp", converter: Core::AWSEpochConverter)]
    property timestamp : Time

    @[JSON::Field(key: "ApproximateValue")]
    property approximate_value : Float64

    def initialize(
      @timestamp : Time,
      @approximate_value : Float64,
    )
    end
  end
end
