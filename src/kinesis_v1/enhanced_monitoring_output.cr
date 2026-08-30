private alias AK = Amazonite::KinesisV1
private alias Core = Amazonite::Core

module Amazonite::KinesisV1
  # Represents the output for EnableEnhancedMonitoring and DisableEnhancedMonitoring.
  class EnhancedMonitoringOutput
    include JSON::Serializable

    # The name of the Kinesis data stream.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String | Nil

    # Represents the current state of the metrics that are in the enhanced state before the operation.
    @[JSON::Field(key: "CurrentShardLevelMetrics", converter: Core::ArrayConverter(AK::MetricsName))]
    property current_shard_level_metrics : Array(MetricsName) | Nil

    # Represents the list of all the metrics that would be in the enhanced state after the operation.
    @[JSON::Field(key: "DesiredShardLevelMetrics", converter: Core::ArrayConverter(AK::MetricsName))]
    property desired_shard_level_metrics : Array(MetricsName) | Nil

    # The ARN of the stream.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String | Nil

    def initialize(
      @stream_name : String | Nil = nil,
      @current_shard_level_metrics : Array(MetricsName) | Nil = nil,
      @desired_shard_level_metrics : Array(MetricsName) | Nil = nil,
      @stream_arn : String | Nil = nil,
    )
    end
  end
end
