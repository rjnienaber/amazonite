private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class DeleteQueueInput
    include JSON::Serializable

    # The ARN of the queue to delete.
    @[JSON::Field(key: "QueueARN")]
    property queue_arn : String

    def initialize(
      @queue_arn : String,
    )
    end

    def validate! : Nil
      if value = @queue_arn
        raise Core::ValidationError.new("QueueARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("QueueARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("QueueARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws.*:kinesis:.*:\\d{12}:queue/\\S+$"))
      end
    end

    def_equals_and_hash(@queue_arn)
  end
end
