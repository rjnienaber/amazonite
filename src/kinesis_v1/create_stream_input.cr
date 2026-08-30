module Amazonite::KinesisV1
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
  end
end
