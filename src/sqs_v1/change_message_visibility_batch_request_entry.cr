module Amazonite::SqsV1
  class ChangeMessageVisibilityBatchRequestEntry
    include JSON::Serializable

    @[JSON::Field(key: "Id")]
    property id : String

    @[JSON::Field(key: "ReceiptHandle")]
    property receipt_handle : String

    @[JSON::Field(key: "VisibilityTimeout")]
    property visibility_timeout : Int32 | Nil

    def initialize(
      @id : String,
      @receipt_handle : String,
      @visibility_timeout : Int32 | Nil = nil,
    )
    end
  end
end
