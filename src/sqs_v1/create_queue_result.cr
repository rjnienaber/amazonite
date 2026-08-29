module Amazonite::SqsV1
  class CreateQueueResult
    include JSON::Serializable

    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String | Nil

    def initialize(
      @queue_url : String | Nil = nil,
    )
    end
  end
end
