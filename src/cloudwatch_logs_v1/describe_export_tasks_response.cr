module Amazonite::CloudWatchLogsV1
  class DescribeExportTasksResponse
    include JSON::Serializable

    # The export tasks.
    @[JSON::Field(key: "exportTasks")]
    property export_tasks : Array(ExportTask) | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @export_tasks : Array(ExportTask) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
