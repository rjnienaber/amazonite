module Amazonite::CloudWatchV1
  class StatisticSet
    include JSON::Serializable

    @[JSON::Field(key: "SampleCount")]
    property sample_count : Float64

    @[JSON::Field(key: "Sum")]
    property sum : Float64

    @[JSON::Field(key: "Minimum")]
    property minimum : Float64

    @[JSON::Field(key: "Maximum")]
    property maximum : Float64

    def initialize(
      @sample_count : Float64,
      @sum : Float64,
      @minimum : Float64,
      @maximum : Float64,
    )
    end
  end
end
