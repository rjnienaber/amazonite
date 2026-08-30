private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @matches
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@matches)
  end
end
