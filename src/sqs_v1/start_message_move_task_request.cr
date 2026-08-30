module Amazonite::SqsV1
  class StartMessageMoveTaskRequest
    include JSON::Serializable

    # The ARN of the queue that contains the messages to be moved to another queue. Currently, only
    # ARNs of dead-letter queues (DLQs) whose sources are other Amazon SQS queues are accepted. DLQs
    # whose sources are non-SQS queues, such as Lambda or Amazon SNS topics, are not currently
    # supported.
    @[JSON::Field(key: "SourceArn")]
    property source_arn : String

    # The ARN of the queue that receives the moved messages. You can use this field to specify the
    # destination queue where you would like to redrive messages. If this field is left blank, the
    # messages will be redriven back to their respective original source queues.
    @[JSON::Field(key: "DestinationArn")]
    property destination_arn : String | Nil

    # The number of messages to be moved per second (the message movement rate). You can use this
    # field to define a fixed message movement rate. The maximum value for messages per second is 500.
    # If this field is left blank, the system will optimize the rate based on the queue message
    # backlog size, which may vary throughout the duration of the message movement task.
    @[JSON::Field(key: "MaxNumberOfMessagesPerSecond")]
    property max_number_of_messages_per_second : Int32 | Nil

    def initialize(
      @source_arn : String,
      @destination_arn : String | Nil = nil,
      @max_number_of_messages_per_second : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@source_arn, @destination_arn, @max_number_of_messages_per_second)
  end
end
