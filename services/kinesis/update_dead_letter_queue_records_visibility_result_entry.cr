private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # A dead-letter record whose visibility timeout was changed.
  class UpdateDeadLetterQueueRecordsVisibilityResultEntry
    include JSON::Serializable

    # The receipt handle of the record whose visibility timeout was changed.
    @[JSON::Field(key: "ReceiptHandle")]
    property receipt_handle : String

    def initialize(
      @receipt_handle : String,
    )
    end

    def validate! : Nil
      if value = @receipt_handle
        raise Core::ValidationError.new("ReceiptHandle length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ReceiptHandle length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@receipt_handle)
  end
end
