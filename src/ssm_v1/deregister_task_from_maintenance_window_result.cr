module Amazonite::SsmV1
  class DeregisterTaskFromMaintenanceWindowResult
    include JSON::Serializable

    @[JSON::Field(key: "WindowId")]
    property window_id : String | Nil

    @[JSON::Field(key: "WindowTaskId")]
    property window_task_id : String | Nil

    def initialize(
      @window_id : String | Nil = nil,
      @window_task_id : String | Nil = nil
    )
    end
  end
end
