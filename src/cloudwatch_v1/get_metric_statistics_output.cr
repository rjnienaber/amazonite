module Amazonite::CloudWatchV1
  class GetMetricStatisticsOutput
    include JSON::Serializable

    @[JSON::Field(key: "Label")]
    property label : String | Nil

    @[JSON::Field(key: "Datapoints")]
    property datapoints : Array(Datapoint) | Nil

    def initialize(
      @label : String | Nil = nil,
      @datapoints : Array(Datapoint) | Nil = nil,
    )
    end
  end
end
