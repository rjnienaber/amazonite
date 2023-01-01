module Amazonite::SsmV1
  class CancelMaintenanceWindowExecutionRequest
    include JSON::Serializable

    @[JSON::Field(key: "WindowExecutionId")]
    property window_execution_id : String

    def initialize(
      @window_execution_id : String
    )
    end
  end
end
