module Amazonite::CloudWatchV1
  class ListMetricStreamsInput
    include JSON::Serializable

    # Include this value, if it was returned by the previous call, to get the next set of metric
    # streams.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The maximum number of results to return in one operation.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def_equals_and_hash(@next_token, @max_results)
  end
end
