module Amazonite::SqsV1
  class SetQueueAttributesRequest
    include JSON::Serializable

    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    @[JSON::Field(key: "Attributes")]
    property attributes : Hash(QueueAttributeName, String)

    def initialize(
      @queue_url : String,
      @attributes : Hash(QueueAttributeName, String),
    )
    end
  end
end
