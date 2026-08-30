module Amazonite::SsmV1
  class GetMaintenanceWindowExecutionRequest
    include JSON::Serializable

    # The ID of the maintenance window execution that includes the task.
    @[JSON::Field(key: "WindowExecutionId")]
    property window_execution_id : String

    def initialize(
      @window_execution_id : String,
    )
    end
  end
end
