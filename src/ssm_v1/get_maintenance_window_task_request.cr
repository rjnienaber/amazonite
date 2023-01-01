module Amazonite::SsmV1
  class GetMaintenanceWindowTaskRequest
    include JSON::Serializable

    @[JSON::Field(key: "WindowId")]
    property window_id : String

    @[JSON::Field(key: "WindowTaskId")]
    property window_task_id : String

    def initialize(
      @window_id : String,
      @window_task_id : String
    )
    end
  end
end
