private alias AK = Amazonite::KinesisV1
private alias Core = Amazonite::Core

module Amazonite::KinesisV1
  # Represents the input for DisableEnhancedMonitoring.
  class DisableEnhancedMonitoringInput
    include JSON::Serializable

    # The name of the Kinesis data stream for which to disable enhanced monitoring.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String | Nil

    # List of shard-level metrics to disable.
    #
    # The following are the valid shard-level metrics. The value "`ALL`" disables every metric.
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

    def validate! : Nil
      if value = @stream_name
        raise Core::ValidationError.new("StreamName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("StreamName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @shard_level_metrics
        raise Core::ValidationError.new("ShardLevelMetrics must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("ShardLevelMetrics must have at most 7 item(s)") if value.size > 7
      end

      if value = @stream_arn
        raise Core::ValidationError.new("StreamARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("StreamARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws.*:kinesis:.*:\\d{12}:stream/\\S+$"))
      end

      if value = @stream_id
        raise Core::ValidationError.new("StreamId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamId length must be <= 24") if value.size > 24
        raise Core::ValidationError.new("StreamId does not match the required pattern") unless value.matches?(Regex.new("^[a-z0-9]{20}-[a-z0-9]{3}$"))
      end
    end

    def_equals_and_hash(@stream_name, @shard_level_metrics, @stream_arn, @stream_id)
  end
end
