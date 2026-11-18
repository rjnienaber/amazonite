private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # A record that was not acknowledged, and why.
  class AcknowledgeQueueRecordsErrorEntry
    include JSON::Serializable

    # The receipt handle of the record that was not acknowledged.
    @[JSON::Field(key: "ReceiptHandle")]
    property receipt_handle : String

    # A code identifying the type of failure. One of `ResourceNotFoundException`,
    # `InvalidArgumentException`, `ThrottlingException`, or `InternalFailureException`.
    @[JSON::Field(key: "ErrorCode")]
    property error_code : String

    # A description of the cause of the failure.
    @[JSON::Field(key: "ErrorMessage")]
    property error_message : String | Nil

    def initialize(
      @receipt_handle : String,
      @error_code : String,
      @error_message : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @receipt_handle
        raise Core::ValidationError.new("ReceiptHandle length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ReceiptHandle length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@receipt_handle, @error_code, @error_message)
  end
end
