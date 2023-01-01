private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class GetMaintenanceWindowExecutionResult
    include JSON::Serializable

    @[JSON::Field(key: "WindowExecutionId")]
    property window_execution_id : String | Nil

    @[JSON::Field(key: "TaskIds")]
    property task_ids : Array(String) | Nil

    @[JSON::Field(key: "Status", converter: AS::MaintenanceWindowExecutionStatus)]
    property status : MaintenanceWindowExecutionStatus | Nil

    @[JSON::Field(key: "StatusDetails")]
    property status_details : String | Nil

    @[JSON::Field(key: "StartTime", converter: Core::AWSEpochConverter)]
    property start_time : Time | Nil

    @[JSON::Field(key: "EndTime", converter: Core::AWSEpochConverter)]
    property end_time : Time | Nil

    def initialize(
      @window_execution_id : String | Nil = nil,
      @task_ids : Array(String) | Nil = nil,
      @status : MaintenanceWindowExecutionStatus | Nil = nil,
      @status_details : String | Nil = nil,
      @start_time : Time | Nil = nil,
      @end_time : Time | Nil = nil
    )
    end
  end
end
