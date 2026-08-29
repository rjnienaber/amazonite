module Amazonite::SqsV1
  class ChangeMessageVisibilityRequest
    include JSON::Serializable

    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    @[JSON::Field(key: "ReceiptHandle")]
    property receipt_handle : String

    @[JSON::Field(key: "VisibilityTimeout")]
    property visibility_timeout : Int32

    def initialize(
      @queue_url : String,
      @receipt_handle : String,
      @visibility_timeout : Int32,
    )
    end
  end
end
