module Amazonite::CloudWatchLogsV1
  class CancelExportTaskRequest
    include JSON::Serializable

    # The ID of the export task.
    @[JSON::Field(key: "taskId")]
    property task_id : String

    def initialize(
      @task_id : String,
    )
    end
  end
end
