private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class MaintenanceWindowTask
    include JSON::Serializable

    @[JSON::Field(key: "WindowId")]
    property window_id : String | Nil

    @[JSON::Field(key: "WindowTaskId")]
    property window_task_id : String | Nil

    @[JSON::Field(key: "TaskArn")]
    property task_arn : String | Nil

    @[JSON::Field(key: "Type", converter: AS::MaintenanceWindowTaskType)]
    property type : MaintenanceWindowTaskType | Nil

    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    @[JSON::Field(key: "TaskParameters")]
    property task_parameters : Hash(String, MaintenanceWindowTaskParameterValueExpression) | Nil

    @[JSON::Field(key: "Priority")]
    property priority : Int32 | Nil

    @[JSON::Field(key: "LoggingInfo")]
    property logging_info : LoggingInfo | Nil

    @[JSON::Field(key: "ServiceRoleArn")]
    property service_role_arn : String | Nil

    @[JSON::Field(key: "MaxConcurrency")]
    property max_concurrency : String | Nil

    @[JSON::Field(key: "MaxErrors")]
    property max_errors : String | Nil

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "CutoffBehavior", converter: AS::MaintenanceWindowTaskCutoffBehavior)]
    property cutoff_behavior : MaintenanceWindowTaskCutoffBehavior | Nil

    @[JSON::Field(key: "AlarmConfiguration")]
    property alarm_configuration : AlarmConfiguration | Nil

    def initialize(
      @window_id : String | Nil = nil,
      @window_task_id : String | Nil = nil,
      @task_arn : String | Nil = nil,
      @type : MaintenanceWindowTaskType | Nil = nil,
      @targets : Array(Target) | Nil = nil,
      @task_parameters : Hash(String, MaintenanceWindowTaskParameterValueExpression) | Nil = nil,
      @priority : Int32 | Nil = nil,
      @logging_info : LoggingInfo | Nil = nil,
      @service_role_arn : String | Nil = nil,
      @max_concurrency : String | Nil = nil,
      @max_errors : String | Nil = nil,
      @name : String | Nil = nil,
      @description : String | Nil = nil,
      @cutoff_behavior : MaintenanceWindowTaskCutoffBehavior | Nil = nil,
      @alarm_configuration : AlarmConfiguration | Nil = nil
    )
    end
  end
end
