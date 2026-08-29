private alias AS = Amazonite::SqsV1
private alias Core = Amazonite::Core

module Amazonite::SqsV1
  class GetQueueAttributesRequest
    include JSON::Serializable

    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    @[JSON::Field(key: "AttributeNames", converter: Core::ArrayConverter(AS::QueueAttributeName))]
    property attribute_names : Array(QueueAttributeName) | Nil

    def initialize(
      @queue_url : String,
      @attribute_names : Array(QueueAttributeName) | Nil = nil,
    )
    end
  end
end
