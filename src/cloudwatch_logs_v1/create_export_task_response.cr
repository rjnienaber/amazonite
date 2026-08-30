module Amazonite::CloudWatchLogsV1
  class CreateExportTaskResponse
    include JSON::Serializable

    # The ID of the export task.
    @[JSON::Field(key: "taskId")]
    property task_id : String | Nil

    def initialize(
      @task_id : String | Nil = nil,
    )
    end
  end
end
