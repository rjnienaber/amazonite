module Amazonite::CloudWatchV1
  # Represents a set of statistics that describes a specific metric.
  class StatisticSet
    include JSON::Serializable

    # The number of samples used for the statistic set.
    @[JSON::Field(key: "SampleCount")]
    property sample_count : Float64

    # The sum of values for the sample set.
    @[JSON::Field(key: "Sum")]
    property sum : Float64

    # The minimum value of the sample set.
    @[JSON::Field(key: "Minimum")]
    property minimum : Float64

    # The maximum value of the sample set.
    @[JSON::Field(key: "Maximum")]
    property maximum : Float64

    def initialize(
      @sample_count : Float64,
      @sum : Float64,
      @minimum : Float64,
      @maximum : Float64,
    )
    end

    def_equals_and_hash(@sample_count, @sum, @minimum, @maximum)
  end
end
