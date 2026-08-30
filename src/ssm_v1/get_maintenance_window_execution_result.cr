private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class GetMaintenanceWindowExecutionResult
    include JSON::Serializable

    # The ID of the maintenance window execution.
    @[JSON::Field(key: "WindowExecutionId")]
    property window_execution_id : String | Nil

    # The ID of the task executions from the maintenance window execution.
    @[JSON::Field(key: "TaskIds")]
    property task_ids : Array(String) | Nil

    # The status of the maintenance window execution.
    @[JSON::Field(key: "Status", converter: AS::MaintenanceWindowExecutionStatus)]
    property status : MaintenanceWindowExecutionStatus | Nil

    # The details explaining the status. Not available for all status values.
    @[JSON::Field(key: "StatusDetails")]
    property status_details : String | Nil

    # The time the maintenance window started running.
    @[JSON::Field(key: "StartTime", converter: Core::AWSEpochConverter)]
    property start_time : Time | Nil

    # The time the maintenance window finished running.
    @[JSON::Field(key: "EndTime", converter: Core::AWSEpochConverter)]
    property end_time : Time | Nil

    def initialize(
      @window_execution_id : String | Nil = nil,
      @task_ids : Array(String) | Nil = nil,
      @status : MaintenanceWindowExecutionStatus | Nil = nil,
      @status_details : String | Nil = nil,
      @start_time : Time | Nil = nil,
      @end_time : Time | Nil = nil,
    )
    end

    def_equals_and_hash(@window_execution_id, @task_ids, @status, @status_details, @start_time, @end_time)
  end
end
