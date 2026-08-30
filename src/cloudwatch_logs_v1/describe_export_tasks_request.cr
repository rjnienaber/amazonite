private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  class DescribeExportTasksRequest
    include JSON::Serializable

    # The ID of the export task. Specifying a task ID filters the results to one or zero export tasks.
    @[JSON::Field(key: "taskId")]
    property task_id : String | Nil

    # The status code of the export task. Specifying a status code filters the results to zero or more
    # export tasks.
    @[JSON::Field(key: "statusCode", converter: ACWL::ExportTaskStatusCode)]
    property status_code : ExportTaskStatusCode | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    # The maximum number of items returned. If you don't specify a value, the default is up to 50
    # items.
    @[JSON::Field(key: "limit")]
    property limit : Int32 | Nil

    def initialize(
      @task_id : String | Nil = nil,
      @status_code : ExportTaskStatusCode | Nil = nil,
      @next_token : String | Nil = nil,
      @limit : Int32 | Nil = nil,
    )
    end

    def_equals_and_hash(@task_id, @status_code, @next_token, @limit)
  end
end
