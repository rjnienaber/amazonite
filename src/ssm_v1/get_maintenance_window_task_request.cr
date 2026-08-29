module Amazonite::SsmV1
  class GetMaintenanceWindowTaskRequest
    include JSON::Serializable

    # The maintenance window ID that includes the task to retrieve.
    @[JSON::Field(key: "WindowId")]
    property window_id : String

    # The maintenance window task ID to retrieve.
    @[JSON::Field(key: "WindowTaskId")]
    property window_task_id : String

    def initialize(
      @window_id : String,
      @window_task_id : String,
    )
    end
  end
end
