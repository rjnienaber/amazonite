module Amazonite::SsmV1
  class RegisterTaskWithMaintenanceWindowResult
    include JSON::Serializable

    # The ID of the task in the maintenance window.
    @[JSON::Field(key: "WindowTaskId")]
    property window_task_id : String | Nil

    def initialize(
      @window_task_id : String | Nil = nil,
    )
    end
  end
end
