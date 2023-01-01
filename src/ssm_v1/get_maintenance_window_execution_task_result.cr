private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class GetMaintenanceWindowExecutionTaskResult
    include JSON::Serializable

    @[JSON::Field(key: "WindowExecutionId")]
    property window_execution_id : String | Nil

    @[JSON::Field(key: "TaskExecutionId")]
    property task_execution_id : String | Nil

    @[JSON::Field(key: "TaskArn")]
    property task_arn : String | Nil

    @[JSON::Field(key: "ServiceRole")]
    property service_role : String | Nil

    @[JSON::Field(key: "Type", converter: AS::MaintenanceWindowTaskType)]
    property type : MaintenanceWindowTaskType | Nil

    @[JSON::Field(key: "TaskParameters")]
    property task_parameters : Array(Hash(String, MaintenanceWindowTaskParameterValueExpression)) | Nil

    @[JSON::Field(key: "Priority")]
    property priority : Int32 | Nil

    @[JSON::Field(key: "MaxConcurrency")]
    property max_concurrency : String | Nil

    @[JSON::Field(key: "MaxErrors")]
    property max_errors : String | Nil

    @[JSON::Field(key: "Status", converter: AS::MaintenanceWindowExecutionStatus)]
    property status : MaintenanceWindowExecutionStatus | Nil

    @[JSON::Field(key: "StatusDetails")]
    property status_details : String | Nil

    @[JSON::Field(key: "StartTime", converter: Core::AWSEpochConverter)]
    property start_time : Time | Nil

    @[JSON::Field(key: "EndTime", converter: Core::AWSEpochConverter)]
    property end_time : Time | Nil

    @[JSON::Field(key: "AlarmConfiguration")]
    property alarm_configuration : AlarmConfiguration | Nil

    @[JSON::Field(key: "TriggeredAlarms")]
    property triggered_alarms : Array(AlarmStateInformation) | Nil

    def initialize(
      @window_execution_id : String | Nil = nil,
      @task_execution_id : String | Nil = nil,
      @task_arn : String | Nil = nil,
      @service_role : String | Nil = nil,
      @type : MaintenanceWindowTaskType | Nil = nil,
      @task_parameters : Array(Hash(String, MaintenanceWindowTaskParameterValueExpression)) | Nil = nil,
      @priority : Int32 | Nil = nil,
      @max_concurrency : String | Nil = nil,
      @max_errors : String | Nil = nil,
      @status : MaintenanceWindowExecutionStatus | Nil = nil,
      @status_details : String | Nil = nil,
      @start_time : Time | Nil = nil,
      @end_time : Time | Nil = nil,
      @alarm_configuration : AlarmConfiguration | Nil = nil,
      @triggered_alarms : Array(AlarmStateInformation) | Nil = nil
    )
    end
  end
end
