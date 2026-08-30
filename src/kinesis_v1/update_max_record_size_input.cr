module Amazonite::KinesisV1
  class UpdateMaxRecordSizeInput
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the stream for the `MaxRecordSize` update.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String | Nil

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    # The maximum record size of a single record in KiB that you can write to, and read from a stream.
    # Specify a value between 1024 and 10240 KiB (1 to 10 MiB). If you specify a value that is out of
    # this range, `UpdateMaxRecordSize` sends back an `ValidationException` message.
    @[JSON::Field(key: "MaxRecordSizeInKiB")]
    property max_record_size_in_ki_b : Int32

    def initialize(
      @max_record_size_in_ki_b : Int32,
      @stream_arn : String | Nil = nil,
      @stream_id : String | Nil = nil,
    )
    end
  end
end
