private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class InsightRuleMetricDatapoint
    include JSON::Serializable

    @[JSON::Field(key: "Timestamp", converter: Core::AWSEpochConverter)]
    property timestamp : Time

    @[JSON::Field(key: "UniqueContributors")]
    property unique_contributors : Float64 | Nil

    @[JSON::Field(key: "MaxContributorValue")]
    property max_contributor_value : Float64 | Nil

    @[JSON::Field(key: "SampleCount")]
    property sample_count : Float64 | Nil

    @[JSON::Field(key: "Average")]
    property average : Float64 | Nil

    @[JSON::Field(key: "Sum")]
    property sum : Float64 | Nil

    @[JSON::Field(key: "Minimum")]
    property minimum : Float64 | Nil

    @[JSON::Field(key: "Maximum")]
    property maximum : Float64 | Nil

    def initialize(
      @timestamp : Time,
      @unique_contributors : Float64 | Nil = nil,
      @max_contributor_value : Float64 | Nil = nil,
      @sample_count : Float64 | Nil = nil,
      @average : Float64 | Nil = nil,
      @sum : Float64 | Nil = nil,
      @minimum : Float64 | Nil = nil,
      @maximum : Float64 | Nil = nil,
    )
    end
  end
end
