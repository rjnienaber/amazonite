module Amazonite::CloudWatchV1
  class ListMetricStreamsOutput
    include JSON::Serializable

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "Entries")]
    property entries : Array(MetricStreamEntry) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @entries : Array(MetricStreamEntry) | Nil = nil,
    )
    end
  end
end
