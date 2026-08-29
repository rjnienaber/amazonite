module Amazonite::SqsV1
  class PurgeQueueRequest
    include JSON::Serializable

    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    def initialize(
      @queue_url : String,
    )
    end
  end
end
