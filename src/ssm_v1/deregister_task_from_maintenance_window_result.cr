module Amazonite::SsmV1
  class DeregisterTaskFromMaintenanceWindowResult
    include JSON::Serializable

    # The ID of the maintenance window the task was removed from.
    @[JSON::Field(key: "WindowId")]
    property window_id : String | Nil

    # The ID of the task removed from the maintenance window.
    @[JSON::Field(key: "WindowTaskId")]
    property window_task_id : String | Nil

    def initialize(
      @window_id : String | Nil = nil,
      @window_task_id : String | Nil = nil,
    )
    end

    def_equals_and_hash(@window_id, @window_task_id)
  end
end
