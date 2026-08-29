module Amazonite::SqsV1
  class GetQueueAttributesResult
    include JSON::Serializable

    @[JSON::Field(key: "Attributes")]
    property attributes : Hash(QueueAttributeName, String) | Nil

    def initialize(
      @attributes : Hash(QueueAttributeName, String) | Nil = nil,
    )
    end
  end
end
