module Amazonite::SqsV1
  # Contains the details of a message movement task.
  class ListMessageMoveTasksResultEntry
    include JSON::Serializable

    # An identifier associated with a message movement task. When this field is returned in the
    # response of the `ListMessageMoveTasks` action, it is only populated for tasks that are in
    # RUNNING status.
    @[JSON::Field(key: "TaskHandle")]
    property task_handle : String | Nil

    # The status of the message movement task. Possible values are: RUNNING, COMPLETED, CANCELLING,
    # CANCELLED, and FAILED.
    @[JSON::Field(key: "Status")]
    property status : String | Nil

    # The ARN of the queue that contains the messages to be moved to another queue.
    @[JSON::Field(key: "SourceArn")]
    property source_arn : String | Nil

    # The ARN of the destination queue if it has been specified in the `StartMessageMoveTask` request.
    # If a `DestinationArn` has not been specified in the `StartMessageMoveTask` request, this field
    # value will be NULL.
    @[JSON::Field(key: "DestinationArn")]
    property destination_arn : String | Nil

    # The number of messages to be moved per second (the message movement rate), if it has been
    # specified in the `StartMessageMoveTask` request. If a `MaxNumberOfMessagesPerSecond` has not
    # been specified in the `StartMessageMoveTask` request, this field value will be NULL.
    @[JSON::Field(key: "MaxNumberOfMessagesPerSecond")]
    property max_number_of_messages_per_second : Int32 | Nil

    # The approximate number of messages already moved to the destination queue.
    @[JSON::Field(key: "ApproximateNumberOfMessagesMoved")]
    property approximate_number_of_messages_moved : Int64 | Nil

    # The number of messages to be moved from the source queue. This number is obtained at the time of
    # starting the message movement task and is only included after the message movement task is
    # selected to start.
    @[JSON::Field(key: "ApproximateNumberOfMessagesToMove")]
    property approximate_number_of_messages_to_move : Int64 | Nil

    # The task failure reason (only included if the task status is FAILED).
    @[JSON::Field(key: "FailureReason")]
    property failure_reason : String | Nil

    # The timestamp of starting the message movement task.
    @[JSON::Field(key: "StartedTimestamp")]
    property started_timestamp : Int64 | Nil

    def initialize(
      @task_handle : String | Nil = nil,
      @status : String | Nil = nil,
      @source_arn : String | Nil = nil,
      @destination_arn : String | Nil = nil,
      @max_number_of_messages_per_second : Int32 | Nil = nil,
      @approximate_number_of_messages_moved : Int64 | Nil = nil,
      @approximate_number_of_messages_to_move : Int64 | Nil = nil,
      @failure_reason : String | Nil = nil,
      @started_timestamp : Int64 | Nil = nil,
    )
    end
  end
end
