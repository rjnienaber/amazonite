private alias Core = Amazonite::Core

module Amazonite::Kinesis
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

    def validate! : Nil
      if value = @sequence_number
        raise Core::ValidationError.new("SequenceNumber does not match the required pattern") unless value.matches?(Regex.new("^0|([1-9]\\d{0,128})$"))
      end

      if value = @shard_id
        raise Core::ValidationError.new("ShardId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ShardId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ShardId does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end
    end

    def_equals_and_hash(@sequence_number, @shard_id, @error_code, @error_message)
  end
end
