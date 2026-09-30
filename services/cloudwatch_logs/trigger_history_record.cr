private alias ACWL = Amazonite::CloudWatchLogs
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @query_id
        raise Core::ValidationError.new("queryId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("queryId length must be <= 256") if value.size > 256
      end

      if value = @triggered_timestamp
        raise Core::ValidationError.new("triggeredTimestamp value must be >= 0") if value < 0
      end

      if value = @destinations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@query_id, @execution_status, @triggered_timestamp, @error_message, @destinations)
  end
end
