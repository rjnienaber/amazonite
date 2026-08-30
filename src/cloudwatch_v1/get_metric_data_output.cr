module Amazonite::CloudWatchV1
  class GetMetricDataOutput
    include JSON::Serializable

    # The metrics that are returned, including the metric name, namespace, and dimensions.
    @[JSON::Field(key: "MetricDataResults")]
    property metric_data_results : Array(MetricDataResult) | Nil

    # A token that marks the next batch of returned results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # Contains a message about this `GetMetricData` operation, if the operation results in such a
    # message. An example of a message that might be returned is `Maximum number of allowed metrics
    # exceeded`. If there is a message, as much of the operation as possible is still executed.
    #
    # A message appears here only if it is related to the global `GetMetricData` operation. Any
    # message about a specific metric returned by the operation appears in the `MetricDataResult`
    # object returned for that metric.
    @[JSON::Field(key: "Messages")]
    property messages : Array(MessageData) | Nil

    def initialize(
      @metric_data_results : Array(MetricDataResult) | Nil = nil,
      @next_token : String | Nil = nil,
      @messages : Array(MessageData) | Nil = nil,
    )
    end

    def_equals_and_hash(@metric_data_results, @next_token, @messages)
  end
end
