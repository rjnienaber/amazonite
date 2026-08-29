module Amazonite::SqsV1
  class CreateQueueRequest
    include JSON::Serializable

    @[JSON::Field(key: "QueueName")]
    property queue_name : String

    @[JSON::Field(key: "Attributes")]
    property attributes : Hash(QueueAttributeName, String) | Nil

    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @queue_name : String,
      @attributes : Hash(QueueAttributeName, String) | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
    )
    end
  end
end
