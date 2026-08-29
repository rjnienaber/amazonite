module Amazonite::EventBridgeV1
  # This structure includes the custom parameter to be used when the target is an SQS FIFO queue.
  class SqsParameters
    include JSON::Serializable

    # The FIFO message group ID to use as the target.
    @[JSON::Field(key: "MessageGroupId")]
    property message_group_id : String | Nil

    def initialize(
      @message_group_id : String | Nil = nil,
    )
    end
  end
end
