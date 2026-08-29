module Amazonite::SqsV1
  class ChangeMessageVisibilityBatchRequest
    include JSON::Serializable

    # The URL of the Amazon SQS queue whose messages' visibility is changed.
    #
    # Queue URLs and names are case-sensitive.
    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    # Lists the receipt handles of the messages for which the visibility timeout must be changed.
    @[JSON::Field(key: "Entries")]
    property entries : Array(ChangeMessageVisibilityBatchRequestEntry) = [] of ChangeMessageVisibilityBatchRequestEntry

    def initialize(
      @queue_url : String,
      @entries : Array(ChangeMessageVisibilityBatchRequestEntry),
    )
    end
  end
end
