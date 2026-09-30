private alias AK = Amazonite::Kinesis
private alias Core = Amazonite::Core

module Amazonite::Kinesis
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

    def validate! : Nil
      if value = @stream_name
        raise Core::ValidationError.new("StreamName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("StreamName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @current_shard_level_metrics
        raise Core::ValidationError.new("CurrentShardLevelMetrics must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("CurrentShardLevelMetrics must have at most 7 item(s)") if value.size > 7
      end

      if value = @desired_shard_level_metrics
        raise Core::ValidationError.new("DesiredShardLevelMetrics must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("DesiredShardLevelMetrics must have at most 7 item(s)") if value.size > 7
      end

      if value = @stream_arn
        raise Core::ValidationError.new("StreamARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("StreamARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws.*:kinesis:.*:\\d{12}:stream/\\S+$"))
      end
    end

    def_equals_and_hash(@stream_name, @current_shard_level_metrics, @desired_shard_level_metrics, @stream_arn)
  end
end
