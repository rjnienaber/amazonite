module Amazonite::SqsV1
  class SendMessageBatchRequest
    include JSON::Serializable

    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    @[JSON::Field(key: "Entries")]
    property entries : Array(SendMessageBatchRequestEntry) = [] of SendMessageBatchRequestEntry

    def initialize(
      @queue_url : String,
      @entries : Array(SendMessageBatchRequestEntry),
    )
    end
  end
end
