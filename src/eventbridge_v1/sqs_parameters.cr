private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @message_group_id
        raise Core::ValidationError.new("MessageGroupId length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("MessageGroupId length must be <= 100") if value.size > 100
      end
    end

    def_equals_and_hash(@message_group_id)
  end
end
