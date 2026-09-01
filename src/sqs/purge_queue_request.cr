module Amazonite::Sqs
  class PurgeQueueRequest
    include JSON::Serializable

    # The URL of the queue from which the `PurgeQueue` action deletes messages.
    #
    # Queue URLs and names are case-sensitive.
    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    def initialize(
      @queue_url : String,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@queue_url)
  end
end
