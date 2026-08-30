module Amazonite::SqsV1
  # Encloses a receipt handle and an identifier for it.
  class DeleteMessageBatchRequestEntry
    include JSON::Serializable

    # The identifier for this particular receipt handle. This is used to communicate the result.
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

    def initialize(
      @id : String,
      @receipt_handle : String,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@id, @receipt_handle)
  end
end
