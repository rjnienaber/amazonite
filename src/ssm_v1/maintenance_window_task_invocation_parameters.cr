module Amazonite::SsmV1
  class MaintenanceWindowTaskInvocationParameters
    include JSON::Serializable

    @[JSON::Field(key: "RunCommand")]
    property run_command : MaintenanceWindowRunCommandParameters | Nil

    @[JSON::Field(key: "Automation")]
    property automation : MaintenanceWindowAutomationParameters | Nil

    @[JSON::Field(key: "StepFunctions")]
    property step_functions : MaintenanceWindowStepFunctionsParameters | Nil

    @[JSON::Field(key: "Lambda")]
    property lambda : MaintenanceWindowLambdaParameters | Nil

    def initialize(
      @run_command : MaintenanceWindowRunCommandParameters | Nil = nil,
      @automation : MaintenanceWindowAutomationParameters | Nil = nil,
      @step_functions : MaintenanceWindowStepFunctionsParameters | Nil = nil,
      @lambda : MaintenanceWindowLambdaParameters | Nil = nil
    )
    end
  end
end
