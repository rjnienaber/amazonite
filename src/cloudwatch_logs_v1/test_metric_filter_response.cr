module Amazonite::CloudWatchLogsV1
  class TestMetricFilterResponse
    include JSON::Serializable

    # The matched events.
    @[JSON::Field(key: "matches")]
    property matches : Array(MetricFilterMatchRecord) | Nil

    def initialize(
      @matches : Array(MetricFilterMatchRecord) | Nil = nil,
    )
    end
  end
end
