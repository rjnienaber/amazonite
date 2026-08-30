private alias AK = Amazonite::KinesisV1
private alias Core = Amazonite::Core

module Amazonite::KinesisV1
  # Represents the output for DescribeStream.
  class StreamDescription
    include JSON::Serializable

    # The name of the stream being described.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String

    # The Amazon Resource Name (ARN) for the stream being described.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String

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
    # Data Streams, you can choose between an **on-demand** capacity mode and a **provisioned**
    # capacity mode for your data streams.
    @[JSON::Field(key: "StreamModeDetails")]
    property stream_mode_details : StreamModeDetails | Nil

    # The shards that comprise the stream.
    @[JSON::Field(key: "Shards")]
    property shards : Array(Shard) = [] of Shard

    # If set to `true`, more shards in the stream are available to describe.
    @[JSON::Field(key: "HasMoreShards")]
    property has_more_shards : Bool

    # The current retention period, in hours. Minimum value of 24. Maximum value of 168.
    @[JSON::Field(key: "RetentionPeriodHours")]
    property retention_period_hours : Int32

    # The approximate time that the stream was created.
    @[JSON::Field(key: "StreamCreationTimestamp", converter: Core::AWSEpochConverter)]
    property stream_creation_timestamp : Time

    # Represents the current enhanced monitoring settings of the stream.
    @[JSON::Field(key: "EnhancedMonitoring")]
    property enhanced_monitoring : Array(EnhancedMetrics) = [] of EnhancedMetrics

    # The server-side encryption type used on the stream. This parameter can be one of the following
    # values:
    #
    # - `NONE`: Do not encrypt the records in the stream.
    #
    # - `KMS`: Use server-side encryption on the records in the stream using a customer-managed Amazon
    # Web Services KMS key.
    @[JSON::Field(key: "EncryptionType", converter: AK::EncryptionType)]
    property encryption_type : EncryptionType | Nil

    # The GUID for the customer-managed Amazon Web Services KMS key to use for encryption. This value
    # can be a globally unique identifier, a fully specified ARN to either an alias or a key, or an
    # alias name prefixed by "alias/".You can also use a master key owned by Kinesis Data Streams by
    # specifying the alias `aws/kinesis`.
    #
    # - Key ARN example: `arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012`
    #
    # - Alias ARN example: `arn:aws:kms:us-east-1:123456789012:alias/MyAliasName`
    #
    # - Globally unique key ID example: `12345678-1234-1234-1234-123456789012`
    #
    # - Alias name example: `alias/MyAliasName`
    #
    # - Master key owned by Kinesis Data Streams: `alias/aws/kinesis`
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    def initialize(
      @stream_name : String,
      @stream_arn : String,
      @stream_status : StreamStatus,
      @shards : Array(Shard),
      @has_more_shards : Bool,
      @retention_period_hours : Int32,
      @stream_creation_timestamp : Time,
      @enhanced_monitoring : Array(EnhancedMetrics),
      @stream_mode_details : StreamModeDetails | Nil = nil,
      @encryption_type : EncryptionType | Nil = nil,
      @key_id : String | Nil = nil,
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

      if value = @stream_mode_details
        value.validate!
      end

      if value = @shards
        value.each(&.validate!)
      end

      if value = @enhanced_monitoring
        value.each(&.validate!)
      end

      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@stream_name, @stream_arn, @stream_status, @stream_mode_details, @shards, @has_more_shards, @retention_period_hours, @stream_creation_timestamp, @enhanced_monitoring, @encryption_type, @key_id)
  end
end
