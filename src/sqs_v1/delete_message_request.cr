module Amazonite::SqsV1
  class DeleteMessageRequest
    include JSON::Serializable

    # The URL of the Amazon SQS queue from which messages are deleted.
    #
    # Queue URLs and names are case-sensitive.
    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    # The receipt handle associated with the message to delete.
    @[JSON::Field(key: "ReceiptHandle")]
    property receipt_handle : String

    def initialize(
      @queue_url : String,
      @receipt_handle : String,
    )
    end

    def_equals_and_hash(@queue_url, @receipt_handle)
  end
end
