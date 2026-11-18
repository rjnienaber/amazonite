private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class ReceiveQueueRecordsInput
    include JSON::Serializable

    # The ARN of the queue to receive records from.
    @[JSON::Field(key: "QueueARN")]
    property queue_arn : String

    # The maximum number of records to return. The queue never returns more records than this value,
    # and might return fewer. The default is 10.
    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    # The duration, in seconds, that the call waits for a record to become visible before returning.
    # The default is 9.
    @[JSON::Field(key: "WaitTimeSeconds")]
    property wait_time_seconds : Int32 | Nil

    # The duration, in seconds, that the records returned by this request are in flight and not
    # visible to any consumer instance. If you do not specify this value, the queue's visibility
    # timeout is used.
    @[JSON::Field(key: "VisibilityTimeoutSeconds")]
    property visibility_timeout_seconds : Int32 | Nil

    def initialize(
      @queue_arn : String,
      @limit : Int32 | Nil = nil,
      @wait_time_seconds : Int32 | Nil = nil,
      @visibility_timeout_seconds : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @queue_arn
        raise Core::ValidationError.new("QueueARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("QueueARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("QueueARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws.*:kinesis:.*:\\d{12}:queue/\\S+$"))
      end

      if value = @limit
        raise Core::ValidationError.new("Limit value must be >= 1") if value < 1
        raise Core::ValidationError.new("Limit value must be <= 10") if value > 10
      end

      if value = @wait_time_seconds
        raise Core::ValidationError.new("WaitTimeSeconds value must be >= 1") if value < 1
        raise Core::ValidationError.new("WaitTimeSeconds value must be <= 20") if value > 20
      end

      if value = @visibility_timeout_seconds
        raise Core::ValidationError.new("VisibilityTimeoutSeconds value must be >= 0") if value < 0
        raise Core::ValidationError.new("VisibilityTimeoutSeconds value must be <= 43200") if value > 43200
      end
    end

    def_equals_and_hash(@queue_arn, @limit, @wait_time_seconds, @visibility_timeout_seconds)
  end
end
