module Amazonite::SqsV1
  class DeleteMessageBatchRequest
    include JSON::Serializable

    # The URL of the Amazon SQS queue from which messages are deleted.
    #
    # Queue URLs and names are case-sensitive.
    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    # Lists the receipt handles for the messages to be deleted.
    @[JSON::Field(key: "Entries")]
    property entries : Array(DeleteMessageBatchRequestEntry) = [] of DeleteMessageBatchRequestEntry

    def initialize(
      @queue_url : String,
      @entries : Array(DeleteMessageBatchRequestEntry),
    )
    end

    def_equals_and_hash(@queue_url, @entries)
  end
end
