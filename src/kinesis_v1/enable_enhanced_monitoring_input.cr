private alias AK = Amazonite::KinesisV1
private alias Core = Amazonite::Core

module Amazonite::KinesisV1
  # Represents the input for EnableEnhancedMonitoring.
  class EnableEnhancedMonitoringInput
    include JSON::Serializable

    # The name of the stream for which to enable enhanced monitoring.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String | Nil

    # List of shard-level metrics to enable.
    #
    # The following are the valid shard-level metrics. The value "`ALL`" enables every metric.
    #
    # - `IncomingBytes`
    #
    # - `IncomingRecords`
    #
    # - `OutgoingBytes`
    #
    # - `OutgoingRecords`
    #
    # - `WriteProvisionedThroughputExceeded`
    #
    # - `ReadProvisionedThroughputExceeded`
    #
    # - `IteratorAgeMilliseconds`
    #
    # - `ALL`
    #
    # For more information, see [Monitoring the Amazon Kinesis Data Streams Service with Amazon
    # CloudWatch](https://docs.aws.amazon.com/kinesis/latest/dev/monitoring-with-cloudwatch.html) in
    # the *Amazon Kinesis Data Streams Developer Guide*.
    @[JSON::Field(key: "ShardLevelMetrics", converter: Core::ArrayConverter(AK::MetricsName))]
    property shard_level_metrics : Array(MetricsName) = [] of MetricsName

    # The ARN of the stream.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String | Nil

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    def initialize(
      @shard_level_metrics : Array(MetricsName),
      @stream_name : String | Nil = nil,
      @stream_arn : String | Nil = nil,
      @stream_id : String | Nil = nil,
    )
    end
  end
end
