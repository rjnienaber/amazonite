module Amazonite::SqsV1
  class DeleteMessageBatchRequestEntry
    include JSON::Serializable

    @[JSON::Field(key: "Id")]
    property id : String

    @[JSON::Field(key: "ReceiptHandle")]
    property receipt_handle : String

    def initialize(
      @id : String,
      @receipt_handle : String,
    )
    end
  end
end
