private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  # Represents an export task.
  class ExportTask
    include JSON::Serializable

    # The ID of the export task.
    @[JSON::Field(key: "taskId")]
    property task_id : String | Nil

    # The name of the export task.
    @[JSON::Field(key: "taskName")]
    property task_name : String | Nil

    # The name of the log group from which logs data was exported.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String | Nil

    # The start time, expressed as the number of milliseconds after `Jan 1, 1970 00:00:00 UTC`. Events
    # with a timestamp before this time are not exported.
    @[JSON::Field(key: "from")]
    property from : Int64 | Nil

    # The end time, expressed as the number of milliseconds after `Jan 1, 1970 00:00:00 UTC`. Events
    # with a timestamp later than this time are not exported.
    @[JSON::Field(key: "to")]
    property to : Int64 | Nil

    # The name of the S3 bucket to which the log data was exported.
    @[JSON::Field(key: "destination")]
    property destination : String | Nil

    # The prefix that was used as the start of Amazon S3 key for every object exported.
    @[JSON::Field(key: "destinationPrefix")]
    property destination_prefix : String | Nil

    # The status of the export task.
    @[JSON::Field(key: "status")]
    property status : ExportTaskStatus | Nil

    # Execution information about the export task.
    @[JSON::Field(key: "executionInfo")]
    property execution_info : ExportTaskExecutionInfo | Nil

    def initialize(
      @task_id : String | Nil = nil,
      @task_name : String | Nil = nil,
      @log_group_name : String | Nil = nil,
      @from : Int64 | Nil = nil,
      @to : Int64 | Nil = nil,
      @destination : String | Nil = nil,
      @destination_prefix : String | Nil = nil,
      @status : ExportTaskStatus | Nil = nil,
      @execution_info : ExportTaskExecutionInfo | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @task_id
        raise Core::ValidationError.new("taskId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("taskId length must be <= 512") if value.size > 512
      end

      if value = @task_name
        raise Core::ValidationError.new("taskName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("taskName length must be <= 512") if value.size > 512
      end

      if value = @log_group_name
        raise Core::ValidationError.new("logGroupName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logGroupName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("logGroupName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_/#A-Za-z0-9]+$"))
      end

      if value = @from
        raise Core::ValidationError.new("from value must be >= 0") if value < 0
      end

      if value = @to
        raise Core::ValidationError.new("to value must be >= 0") if value < 0
      end

      if value = @destination
        raise Core::ValidationError.new("destination length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("destination length must be <= 512") if value.size > 512
      end

      if value = @status
        value.validate!
      end

      if value = @execution_info
        value.validate!
      end
    end

    def_equals_and_hash(@task_id, @task_name, @log_group_name, @from, @to, @destination, @destination_prefix, @status, @execution_info)
  end
end
