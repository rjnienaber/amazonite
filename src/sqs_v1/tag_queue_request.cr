module Amazonite::SqsV1
  class TagQueueRequest
    include JSON::Serializable

    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    @[JSON::Field(key: "Tags")]
    property tags : Hash(String, String)

    def initialize(
      @queue_url : String,
      @tags : Hash(String, String),
    )
    end
  end
end
