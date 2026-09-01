private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # Represents the input for `CreateStream`.
  class CreateStreamInput
    include JSON::Serializable

    # A name to identify the stream. The stream name is scoped to the Amazon Web Services account used
    # by the application that creates the stream. It is also scoped by Amazon Web Services Region.
    # That is, two streams in two different Amazon Web Services accounts can have the same name. Two
    # streams in the same Amazon Web Services account but in two different Regions can also have the
    # same name.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String

    # The number of shards that the stream will use. The throughput of the stream is a function of the
    # number of shards; more shards are required for greater provisioned throughput.
    @[JSON::Field(key: "ShardCount")]
    property shard_count : Int32 | Nil

    # Indicates the capacity mode of the data stream. Currently, in Kinesis Data Streams, you can
    # choose between an **on-demand** capacity mode and a **provisioned** capacity mode for your data
    # streams.
    @[JSON::Field(key: "StreamModeDetails")]
    property stream_mode_details : StreamModeDetails | Nil

    # A set of up to 50 key-value pairs to use to create the tags. A tag consists of a required key
    # and an optional value.
    @[JSON::Field(key: "Tags")]
    property tags : Hash(String, String) | Nil

    # The target warm throughput in MB/s that the stream should be scaled to handle. This represents
    # the throughput capacity that will be immediately available for write operations.
    @[JSON::Field(key: "WarmThroughputMiBps")]
    property warm_throughput_mi_bps : Int32 | Nil

    # The maximum record size of a single record in kibibyte (KiB) that you can write to, and read
    # from a stream.
    @[JSON::Field(key: "MaxRecordSizeInKiB")]
    property max_record_size_in_ki_b : Int32 | Nil

    def initialize(
      @stream_name : String,
      @shard_count : Int32 | Nil = nil,
      @stream_mode_details : StreamModeDetails | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
      @warm_throughput_mi_bps : Int32 | Nil = nil,
      @max_record_size_in_ki_b : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @stream_name
        raise Core::ValidationError.new("StreamName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("StreamName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @shard_count
        raise Core::ValidationError.new("ShardCount value must be >= 1") if value < 1
      end

      if value = @stream_mode_details
        value.validate!
      end

      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 1 entry(s)") if value.size < 1
        raise Core::ValidationError.new("Tags must have at most 200 entry(s)") if value.size > 200
      end

      if value = @warm_throughput_mi_bps
        raise Core::ValidationError.new("WarmThroughputMiBps value must be >= 0") if value < 0
      end

      if value = @max_record_size_in_ki_b
        raise Core::ValidationError.new("MaxRecordSizeInKiB value must be >= 1024") if value < 1024
        raise Core::ValidationError.new("MaxRecordSizeInKiB value must be <= 10240") if value > 10240
      end
    end

    def_equals_and_hash(@stream_name, @shard_count, @stream_mode_details, @tags, @warm_throughput_mi_bps, @max_record_size_in_ki_b)
  end
end
