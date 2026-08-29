module Amazonite::CloudWatchV1
  class StartMetricStreamsInput
    include JSON::Serializable

    # The array of the names of metric streams to start streaming.
    #
    # This is an "all or nothing" operation. If you do not have permission to access all of the metric
    # streams that you list here, then none of the streams that you list in the operation will start
    # streaming.
    @[JSON::Field(key: "Names")]
    property names : Array(String) = [] of String

    def initialize(
      @names : Array(String),
    )
    end
  end
end
