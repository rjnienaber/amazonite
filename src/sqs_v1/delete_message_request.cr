module Amazonite::SqsV1
  class DeleteMessageRequest
    include JSON::Serializable

    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    @[JSON::Field(key: "ReceiptHandle")]
    property receipt_handle : String

    def initialize(
      @queue_url : String,
      @receipt_handle : String,
    )
    end
  end
end
