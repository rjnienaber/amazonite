module Amazonite::KinesisV1
  # Represents the result of an individual record from a `PutRecords` request. A record that is
  # successfully added to a stream includes `SequenceNumber` and `ShardId` in the result. A record
  # that fails to be added to the stream includes `ErrorCode` and `ErrorMessage` in the result.
  class PutRecordsResultEntry
    include JSON::Serializable

    # The sequence number for an individual record result.
    @[JSON::Field(key: "SequenceNumber")]
    property sequence_number : String | Nil

    # The shard ID for an individual record result.
    @[JSON::Field(key: "ShardId")]
    property shard_id : String | Nil

    # The error code for an individual record result. `ErrorCodes` can be either
    # `ProvisionedThroughputExceededException` or `InternalFailure`.
    @[JSON::Field(key: "ErrorCode")]
    property error_code : String | Nil

    # The error message for an individual record result. An `ErrorCode` value of
    # `ProvisionedThroughputExceededException` has an error message that includes the account ID,
    # stream name, and shard ID. An `ErrorCode` value of `InternalFailure` has the error message
    # `"Internal Service Failure"`.
    @[JSON::Field(key: "ErrorMessage")]
    property error_message : String | Nil

    def initialize(
      @sequence_number : String | Nil = nil,
      @shard_id : String | Nil = nil,
      @error_code : String | Nil = nil,
      @error_message : String | Nil = nil,
    )
    end
  end
end
