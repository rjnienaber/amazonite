module Amazonite::SqsV1
  class DeleteQueueRequest
    include JSON::Serializable

    # The URL of the Amazon SQS queue to delete.
    #
    # Queue URLs and names are case-sensitive.
    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    def initialize(
      @queue_url : String,
    )
    end
  end
end
