module Amazonite::SqsV1
  class SendMessageBatchRequest
    include JSON::Serializable

    # The URL of the Amazon SQS queue to which batched messages are sent.
    #
    # Queue URLs and names are case-sensitive.
    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    # A list of ` SendMessageBatchRequestEntry ` items.
    @[JSON::Field(key: "Entries")]
    property entries : Array(SendMessageBatchRequestEntry) = [] of SendMessageBatchRequestEntry

    def initialize(
      @queue_url : String,
      @entries : Array(SendMessageBatchRequestEntry),
    )
    end

    def_equals_and_hash(@queue_url, @entries)
  end
end
