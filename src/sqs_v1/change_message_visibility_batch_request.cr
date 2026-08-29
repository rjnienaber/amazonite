module Amazonite::SqsV1
  class ChangeMessageVisibilityBatchRequest
    include JSON::Serializable

    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    @[JSON::Field(key: "Entries")]
    property entries : Array(ChangeMessageVisibilityBatchRequestEntry)

    def initialize(
      @queue_url : String,
      @entries : Array(ChangeMessageVisibilityBatchRequestEntry),
    )
    end
  end
end
