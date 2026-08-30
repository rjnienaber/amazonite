private alias ACWL = Amazonite::CloudWatchLogsV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class GetScheduledQueryHistoryRequest
    include JSON::Serializable

    # The ARN or name of the scheduled query to retrieve history for.
    @[JSON::Field(key: "identifier")]
    property identifier : String

    # The start time for the history query in Unix epoch format.
    @[JSON::Field(key: "startTime")]
    property start_time : Int64

    # The end time for the history query in Unix epoch format.
    @[JSON::Field(key: "endTime")]
    property end_time : Int64

    # An array of execution statuses to filter the history results. Only executions with the specified
    # statuses are returned.
    @[JSON::Field(key: "executionStatuses", converter: Core::ArrayConverter(ACWL::ExecutionStatus))]
    property execution_statuses : Array(ExecutionStatus) | Nil

    # The maximum number of history records to return. Valid range is 1 to 1000.
    @[JSON::Field(key: "maxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @identifier : String,
      @start_time : Int64,
      @end_time : Int64,
      @execution_statuses : Array(ExecutionStatus) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @identifier
        raise Core::ValidationError.new("identifier length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("identifier length must be <= 300") if value.size > 300
      end

      if value = @start_time
        raise Core::ValidationError.new("startTime value must be >= 0") if value < 0
      end

      if value = @end_time
        raise Core::ValidationError.new("endTime value must be >= 0") if value < 0
      end

      if value = @max_results
        raise Core::ValidationError.new("maxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("maxResults value must be <= 1000") if value > 1000
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@identifier, @start_time, @end_time, @execution_statuses, @max_results, @next_token)
  end
end
