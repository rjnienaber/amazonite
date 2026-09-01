private alias AK = Amazonite::Kinesis
private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # Represents enhanced metrics types.
  class EnhancedMetrics
    include JSON::Serializable

    # List of shard-level metrics.
    #
    # The following are the valid shard-level metrics. The value "`ALL`" enhances every metric.
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
    property shard_level_metrics : Array(MetricsName) | Nil

    def initialize(
      @shard_level_metrics : Array(MetricsName) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @shard_level_metrics
        raise Core::ValidationError.new("ShardLevelMetrics must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("ShardLevelMetrics must have at most 7 item(s)") if value.size > 7
      end
    end

    def_equals_and_hash(@shard_level_metrics)
  end
end
