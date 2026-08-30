module Amazonite::SsmV1
  class CancelMaintenanceWindowExecutionRequest
    include JSON::Serializable

    # The ID of the maintenance window execution to stop.
    @[JSON::Field(key: "WindowExecutionId")]
    property window_execution_id : String

    def initialize(
      @window_execution_id : String,
    )
    end

    def_equals_and_hash(@window_execution_id)
  end
end
