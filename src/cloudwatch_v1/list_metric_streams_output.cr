module Amazonite::CloudWatchV1
  class ListMetricStreamsOutput
    include JSON::Serializable

    # The token that marks the start of the next batch of returned results. You can use this token in
    # a subsequent operation to get the next batch of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The array of metric stream information.
    @[JSON::Field(key: "Entries")]
    property entries : Array(MetricStreamEntry) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @entries : Array(MetricStreamEntry) | Nil = nil,
    )
    end

    def_equals_and_hash(@next_token, @entries)
  end
end
