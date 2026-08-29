private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Describes the information about an execution of a maintenance window.
  class MaintenanceWindowExecution
    include JSON::Serializable

    # The ID of the maintenance window.
    @[JSON::Field(key: "WindowId")]
    property window_id : String | Nil

    # The ID of the maintenance window execution.
    @[JSON::Field(key: "WindowExecutionId")]
    property window_execution_id : String | Nil

    # The status of the execution.
    @[JSON::Field(key: "Status", converter: AS::MaintenanceWindowExecutionStatus)]
    property status : MaintenanceWindowExecutionStatus | Nil

    # The details explaining the status. Not available for all status values.
    @[JSON::Field(key: "StatusDetails")]
    property status_details : String | Nil

    # The time the execution started.
    @[JSON::Field(key: "StartTime", converter: Core::AWSEpochConverter)]
    property start_time : Time | Nil

    # The time the execution finished.
    @[JSON::Field(key: "EndTime", converter: Core::AWSEpochConverter)]
    property end_time : Time | Nil

    def initialize(
      @window_id : String | Nil = nil,
      @window_execution_id : String | Nil = nil,
      @status : MaintenanceWindowExecutionStatus | Nil = nil,
      @status_details : String | Nil = nil,
      @start_time : Time | Nil = nil,
      @end_time : Time | Nil = nil,
    )
    end
  end
end
