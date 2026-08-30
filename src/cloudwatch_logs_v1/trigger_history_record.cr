private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  # A record of a scheduled query execution, including execution status, timestamp, and destination
  # processing results.
  class TriggerHistoryRecord
    include JSON::Serializable

    # The unique identifier for this query execution.
    @[JSON::Field(key: "queryId")]
    property query_id : String | Nil

    # The execution status of the scheduled query run.
    @[JSON::Field(key: "executionStatus", converter: ACWL::ExecutionStatus)]
    property execution_status : ExecutionStatus | Nil

    # The timestamp when the scheduled query execution was triggered.
    @[JSON::Field(key: "triggeredTimestamp")]
    property triggered_timestamp : Int64 | Nil

    # Error message if the query execution failed.
    @[JSON::Field(key: "errorMessage")]
    property error_message : String | Nil

    # Information about destination processing for this query execution.
    @[JSON::Field(key: "destinations")]
    property destinations : Array(ScheduledQueryDestination) | Nil

    def initialize(
      @query_id : String | Nil = nil,
      @execution_status : ExecutionStatus | Nil = nil,
      @triggered_timestamp : Int64 | Nil = nil,
      @error_message : String | Nil = nil,
      @destinations : Array(ScheduledQueryDestination) | Nil = nil,
    )
    end
  end
end
