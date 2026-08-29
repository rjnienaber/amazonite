module Amazonite::SqsV1
  class DeleteMessageBatchRequest
    include JSON::Serializable

    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    @[JSON::Field(key: "Entries")]
    property entries : Array(DeleteMessageBatchRequestEntry) = [] of DeleteMessageBatchRequestEntry

    def initialize(
      @queue_url : String,
      @entries : Array(DeleteMessageBatchRequestEntry),
    )
    end
  end
end
