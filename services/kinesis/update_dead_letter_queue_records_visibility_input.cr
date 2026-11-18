private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class UpdateDeadLetterQueueRecordsVisibilityInput
    include JSON::Serializable

    # The ARN of the queue whose dead-letter records are updated.
    @[JSON::Field(key: "QueueARN")]
    property queue_arn : String

    # The dead-letter records whose visibility timeout is changed, identified by their receipt
    # handles, and the new visibility timeout for each.
    @[JSON::Field(key: "Entries")]
    property entries : Array(UpdateDeadLetterQueueRecordsVisibilityRequestEntry) = [] of UpdateDeadLetterQueueRecordsVisibilityRequestEntry

    def initialize(
      @queue_arn : String,
      @entries : Array(UpdateDeadLetterQueueRecordsVisibilityRequestEntry),
    )
    end

    def validate! : Nil
      if value = @queue_arn
        raise Core::ValidationError.new("QueueARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("QueueARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("QueueARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws.*:kinesis:.*:\\d{12}:queue/\\S+$"))
      end

      if value = @entries
        raise Core::ValidationError.new("Entries must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Entries must have at most 10 item(s)") if value.size > 10
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@queue_arn, @entries)
  end
end
