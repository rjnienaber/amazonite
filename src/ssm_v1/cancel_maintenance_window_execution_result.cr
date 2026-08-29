module Amazonite::SsmV1
  class CancelMaintenanceWindowExecutionResult
    include JSON::Serializable

    # The ID of the maintenance window execution that has been stopped.
    @[JSON::Field(key: "WindowExecutionId")]
    property window_execution_id : String | Nil

    def initialize(
      @window_execution_id : String | Nil = nil,
    )
    end
  end
end
