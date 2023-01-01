module Amazonite::SsmV1
  class CancelMaintenanceWindowExecutionResult
    include JSON::Serializable

    @[JSON::Field(key: "WindowExecutionId")]
    property window_execution_id : String | Nil

    def initialize(
      @window_execution_id : String | Nil = nil
    )
    end
  end
end
