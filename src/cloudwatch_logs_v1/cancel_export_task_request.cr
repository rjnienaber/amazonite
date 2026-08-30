private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @task_id
        raise Core::ValidationError.new("taskId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("taskId length must be <= 512") if value.size > 512
      end
    end

    def_equals_and_hash(@task_id)
  end
end
