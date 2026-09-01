module Amazonite::CloudWatch
  class StopMetricStreamsInput
    include JSON::Serializable

    # The array of the names of metric streams to stop streaming.
    #
    # This is an "all or nothing" operation. If you do not have permission to access all of the metric
    # streams that you list here, then none of the streams that you list in the operation will stop
    # streaming.
    @[JSON::Field(key: "Names")]
    property names : Array(String) = [] of String

    def initialize(
      @names : Array(String),
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@names)
  end
end
