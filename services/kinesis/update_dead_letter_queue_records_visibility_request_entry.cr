private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # A dead-letter record whose visibility timeout is changed, and the new visibility timeout.
  class UpdateDeadLetterQueueRecordsVisibilityRequestEntry
    include JSON::Serializable

    # The receipt handle of the record, as returned by ReceiveDeadLetterQueueRecords.
    @[JSON::Field(key: "ReceiptHandle")]
    property receipt_handle : String

    # The new duration, in seconds, that the record is in flight and not visible to any consumer
    # instance, measured from when this request is processed. Specify `0` to make the record visible
    # immediately.
    @[JSON::Field(key: "VisibilityTimeoutSeconds")]
    property visibility_timeout_seconds : Int32

    def initialize(
      @receipt_handle : String,
      @visibility_timeout_seconds : Int32,
    )
    end

    def validate! : Nil
      if value = @receipt_handle
        raise Core::ValidationError.new("ReceiptHandle length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ReceiptHandle length must be <= 1024") if value.size > 1024
      end

      if value = @visibility_timeout_seconds
        raise Core::ValidationError.new("VisibilityTimeoutSeconds value must be >= 0") if value < 0
        raise Core::ValidationError.new("VisibilityTimeoutSeconds value must be <= 43200") if value > 43200
      end
    end

    def_equals_and_hash(@receipt_handle, @visibility_timeout_seconds)
  end
end
