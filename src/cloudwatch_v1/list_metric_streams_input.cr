module Amazonite::CloudWatchV1
  class ListMetricStreamsInput
    include JSON::Serializable

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end
  end
end
