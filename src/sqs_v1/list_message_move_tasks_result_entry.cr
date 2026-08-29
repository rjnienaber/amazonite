module Amazonite::SqsV1
  class ListMessageMoveTasksResultEntry
    include JSON::Serializable

    @[JSON::Field(key: "TaskHandle")]
    property task_handle : String | Nil

    @[JSON::Field(key: "Status")]
    property status : String | Nil

    @[JSON::Field(key: "SourceArn")]
    property source_arn : String | Nil

    @[JSON::Field(key: "DestinationArn")]
    property destination_arn : String | Nil

    @[JSON::Field(key: "MaxNumberOfMessagesPerSecond")]
    property max_number_of_messages_per_second : Int32 | Nil

    @[JSON::Field(key: "ApproximateNumberOfMessagesMoved")]
    property approximate_number_of_messages_moved : Int64 | Nil

    @[JSON::Field(key: "ApproximateNumberOfMessagesToMove")]
    property approximate_number_of_messages_to_move : Int64 | Nil

    @[JSON::Field(key: "FailureReason")]
    property failure_reason : String | Nil

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
