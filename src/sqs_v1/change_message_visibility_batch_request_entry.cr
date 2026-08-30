module Amazonite::SqsV1
  # Encloses a receipt handle and an entry ID for each message in ` ChangeMessageVisibilityBatch.`
  class ChangeMessageVisibilityBatchRequestEntry
    include JSON::Serializable

    # An identifier for this particular receipt handle used to communicate the result.
    #
    # The `Id`s of a batch request need to be unique within a request.
    #
    # This identifier can have up to 80 characters. The following characters are accepted:
    # alphanumeric characters, hyphens(-), and underscores (_).
    @[JSON::Field(key: "Id")]
    property id : String

    # A receipt handle.
    @[JSON::Field(key: "ReceiptHandle")]
    property receipt_handle : String

    # The new value (in seconds) for the message's visibility timeout.
    @[JSON::Field(key: "VisibilityTimeout")]
    property visibility_timeout : Int32 | Nil

    def initialize(
      @id : String,
      @receipt_handle : String,
      @visibility_timeout : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@id, @receipt_handle, @visibility_timeout)
  end
end
