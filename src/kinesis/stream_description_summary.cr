private alias AK = Amazonite::Kinesis
private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # Represents the output for DescribeStreamSummary
  class StreamDescriptionSummary
    include JSON::Serializable

    # The name of the stream being described.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String

    # The Amazon Resource Name (ARN) for the stream being described.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    # The current status of the stream being described. The stream status is one of the following
    # states:
    #
    # - `CREATING` - The stream is being created. Kinesis Data Streams immediately returns and sets
    # `StreamStatus` to `CREATING`.
    #
    # - `DELETING` - The stream is being deleted. The specified stream is in the `DELETING` state
    # until Kinesis Data Streams completes the deletion.
    #
    # - `ACTIVE` - The stream exists and is ready for read and write operations or deletion. You
    # should perform read and write operations only on an `ACTIVE` stream.
    #
    # - `UPDATING` - Shards in the stream are being merged or split. Read and write operations
    # continue to work while the stream is in the `UPDATING` state.
    @[JSON::Field(key: "StreamStatus", converter: AK::StreamStatus)]
    property stream_status : StreamStatus

    # Specifies the capacity mode to which you want to set your data stream. Currently, in Kinesis
    # Data Streams, you can choose between an **on-demand** ycapacity mode and a **provisioned**
    # capacity mode for your data streams.
    @[JSON::Field(key: "StreamModeDetails")]
    property stream_mode_details : StreamModeDetails | Nil

    # The current retention period, in hours.
    @[JSON::Field(key: "RetentionPeriodHours")]
    property retention_period_hours : Int32

    # The approximate time that the stream was created.
    @[JSON::Field(key: "StreamCreationTimestamp", converter: Core::AWSEpochConverter)]
    property stream_creation_timestamp : Time

    # Represents the current enhanced monitoring settings of the stream.
    @[JSON::Field(key: "EnhancedMonitoring")]
    property enhanced_monitoring : Array(EnhancedMetrics) = [] of EnhancedMetrics

    # The encryption type used. This value is one of the following:
    #
    # - `KMS`
    #
    # - `NONE`
    @[JSON::Field(key: "EncryptionType", converter: AK::EncryptionType)]
    property encryption_type : EncryptionType | Nil

    # The GUID for the customer-managed Amazon Web Services KMS key to use for encryption. This value
    # can be a globally unique identifier, a fully specified ARN to either an alias or a key, or an
    # alias name prefixed by "alias/".You can also use a master key owned by Kinesis Data Streams by
    # specifying the alias `aws/kinesis`.
    #
    # - Key ARN example: `arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012`
    #
    # - Alias ARN example: ` arn:aws:kms:us-east-1:123456789012:alias/MyAliasName`
    #
    # - Globally unique key ID example: `12345678-1234-1234-1234-123456789012`
    #
    # - Alias name example: `alias/MyAliasName`
    #
    # - Master key owned by Kinesis Data Streams: `alias/aws/kinesis`
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    # The number of open shards in the stream.
    @[JSON::Field(key: "OpenShardCount")]
    property open_shard_count : Int32

    # The number of enhanced fan-out consumers registered with the stream.
    @[JSON::Field(key: "ConsumerCount")]
    property consumer_count : Int32 | Nil

    # The warm throughput in MB/s for the stream. This represents the throughput capacity that will be
    # immediately available for write operations.
    @[JSON::Field(key: "WarmThroughput")]
    property warm_throughput : WarmThroughputObject | Nil

    # The maximum record size of a single record in kibibyte (KiB) that you can write to, and read
    # from a stream.
    @[JSON::Field(key: "MaxRecordSizeInKiB")]
    property max_record_size_in_ki_b : Int32 | Nil

    # The number of channels associated with the stream.
    @[JSON::Field(key: "ChannelCount")]
    property channel_count : Int32 | Nil

    def initialize(
      @stream_name : String,
      @stream_arn : String,
      @stream_status : StreamStatus,
      @retention_period_hours : Int32,
      @stream_creation_timestamp : Time,
      @enhanced_monitoring : Array(EnhancedMetrics),
      @open_shard_count : Int32,
      @stream_id : String | Nil = nil,
      @stream_mode_details : StreamModeDetails | Nil = nil,
      @encryption_type : EncryptionType | Nil = nil,
      @key_id : String | Nil = nil,
      @consumer_count : Int32 | Nil = nil,
      @warm_throughput : WarmThroughputObject | Nil = nil,
      @max_record_size_in_ki_b : Int32 | Nil = nil,
      @channel_count : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @stream_name
        raise Core::ValidationError.new("StreamName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("StreamName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
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

      if value = @stream_mode_details
        value.validate!
      end

      if value = @enhanced_monitoring
        value.each(&.validate!)
      end

      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end

      if value = @open_shard_count
        raise Core::ValidationError.new("OpenShardCount value must be >= 0") if value < 0
        raise Core::ValidationError.new("OpenShardCount value must be <= 1000000") if value > 1000000
      end

      if value = @consumer_count
        raise Core::ValidationError.new("ConsumerCount value must be >= 0") if value < 0
        raise Core::ValidationError.new("ConsumerCount value must be <= 1000000") if value > 1000000
      end

      if value = @warm_throughput
        value.validate!
      end

      if value = @max_record_size_in_ki_b
        raise Core::ValidationError.new("MaxRecordSizeInKiB value must be >= 1024") if value < 1024
        raise Core::ValidationError.new("MaxRecordSizeInKiB value must be <= 10240") if value > 10240
      end

      if value = @channel_count
        raise Core::ValidationError.new("ChannelCount value must be >= 0") if value < 0
        raise Core::ValidationError.new("ChannelCount value must be <= 1000000") if value > 1000000
      end
    end

    def_equals_and_hash(@stream_name, @stream_arn, @stream_id, @stream_status, @stream_mode_details, @retention_period_hours, @stream_creation_timestamp, @enhanced_monitoring, @encryption_type, @key_id, @open_shard_count, @consumer_count, @warm_throughput, @max_record_size_in_ki_b, @channel_count)
  end
end
