private alias AK = Amazonite::KinesisV1
private alias Core = Amazonite::Core

module Amazonite::KinesisV1
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
  end
end
