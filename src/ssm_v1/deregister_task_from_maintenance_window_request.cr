module Amazonite::SsmV1
  class DeregisterTaskFromMaintenanceWindowRequest
    include JSON::Serializable

    # The ID of the maintenance window the task should be removed from.
    @[JSON::Field(key: "WindowId")]
    property window_id : String

    # The ID of the task to remove from the maintenance window.
    @[JSON::Field(key: "WindowTaskId")]
    property window_task_id : String

    def initialize(
      @window_id : String,
      @window_task_id : String,
    )
    end

    def_equals_and_hash(@window_id, @window_task_id)
  end
end
