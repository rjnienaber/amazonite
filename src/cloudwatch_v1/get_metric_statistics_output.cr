private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class GetMetricStatisticsOutput
    include JSON::Serializable

    # A label for the specified metric.
    @[JSON::Field(key: "Label")]
    property label : String | Nil

    # The data points for the specified metric.
    @[JSON::Field(key: "Datapoints")]
    property datapoints : Array(Datapoint) | Nil

    def initialize(
      @label : String | Nil = nil,
      @datapoints : Array(Datapoint) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @datapoints
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@label, @datapoints)
  end
end
