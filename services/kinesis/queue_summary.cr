private alias AK = Amazonite::Kinesis
private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # A summary of a queue. Returned by ListQueues. To retrieve a queue's configuration attributes,
  # use DescribeQueue.
  class QueueSummary
    include JSON::Serializable

    # The name of the queue.
    @[JSON::Field(key: "QueueName")]
    property queue_name : String

    # The ARN of the queue.
    @[JSON::Field(key: "QueueARN")]
    property queue_arn : String

    # The current status of the queue.
    @[JSON::Field(key: "QueueStatus", converter: AK::QueueStatus)]
    property queue_status : QueueStatus

    # The time the queue was created.
    @[JSON::Field(key: "QueueCreationTimestamp", converter: Core::AWSEpochConverter)]
    property queue_creation_timestamp : Time

    # The data stream the queue delivers records from.
    @[JSON::Field(key: "Streams")]
    property streams : Array(QueueStreamIdentifier) = [] of QueueStreamIdentifier

    def initialize(
      @queue_name : String,
      @queue_arn : String,
      @queue_status : QueueStatus,
      @queue_creation_timestamp : Time,
      @streams : Array(QueueStreamIdentifier),
    )
    end

    def validate! : Nil
      if value = @queue_name
        raise Core::ValidationError.new("QueueName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("QueueName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("QueueName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @queue_arn
        raise Core::ValidationError.new("QueueARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("QueueARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("QueueARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws.*:kinesis:.*:\\d{12}:queue/\\S+$"))
      end

      if value = @streams
        raise Core::ValidationError.new("Streams must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Streams must have at most 10000 item(s)") if value.size > 10000
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@queue_name, @queue_arn, @queue_status, @queue_creation_timestamp, @streams)
  end
end
