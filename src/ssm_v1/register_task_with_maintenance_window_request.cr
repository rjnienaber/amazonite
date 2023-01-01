private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class RegisterTaskWithMaintenanceWindowRequest
    include JSON::Serializable

    @[JSON::Field(key: "WindowId")]
    property window_id : String

    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    @[JSON::Field(key: "TaskArn")]
    property task_arn : String

    @[JSON::Field(key: "ServiceRoleArn")]
    property service_role_arn : String | Nil

    @[JSON::Field(key: "TaskType", converter: AS::MaintenanceWindowTaskType)]
    property task_type : MaintenanceWindowTaskType

    @[JSON::Field(key: "TaskParameters")]
    property task_parameters : Hash(String, MaintenanceWindowTaskParameterValueExpression) | Nil

    @[JSON::Field(key: "TaskInvocationParameters")]
    property task_invocation_parameters : MaintenanceWindowTaskInvocationParameters | Nil

    @[JSON::Field(key: "Priority")]
    property priority : Int32 | Nil

    @[JSON::Field(key: "MaxConcurrency")]
    property max_concurrency : String | Nil

    @[JSON::Field(key: "MaxErrors")]
    property max_errors : String | Nil

    @[JSON::Field(key: "LoggingInfo")]
    property logging_info : LoggingInfo | Nil

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "ClientToken")]
    property client_token : String | Nil

    @[JSON::Field(key: "CutoffBehavior", converter: AS::MaintenanceWindowTaskCutoffBehavior)]
    property cutoff_behavior : MaintenanceWindowTaskCutoffBehavior | Nil

    @[JSON::Field(key: "AlarmConfiguration")]
    property alarm_configuration : AlarmConfiguration | Nil

    def initialize(
      @window_id : String,
      @task_arn : String,
      @task_type : MaintenanceWindowTaskType,
      @targets : Array(Target) | Nil = nil,
      @service_role_arn : String | Nil = nil,
      @task_parameters : Hash(String, MaintenanceWindowTaskParameterValueExpression) | Nil = nil,
      @task_invocation_parameters : MaintenanceWindowTaskInvocationParameters | Nil = nil,
      @priority : Int32 | Nil = nil,
      @max_concurrency : String | Nil = nil,
      @max_errors : String | Nil = nil,
      @logging_info : LoggingInfo | Nil = nil,
      @name : String | Nil = nil,
      @description : String | Nil = nil,
      @client_token : String | Nil = nil,
      @cutoff_behavior : MaintenanceWindowTaskCutoffBehavior | Nil = nil,
      @alarm_configuration : AlarmConfiguration | Nil = nil
    )
    end
  end
end
