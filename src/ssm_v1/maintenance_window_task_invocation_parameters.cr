module Amazonite::SsmV1
  # The parameters for task execution.
  class MaintenanceWindowTaskInvocationParameters
    include JSON::Serializable

    # The parameters for a `RUN_COMMAND` task type.
    @[JSON::Field(key: "RunCommand")]
    property run_command : MaintenanceWindowRunCommandParameters | Nil

    # The parameters for an `AUTOMATION` task type.
    @[JSON::Field(key: "Automation")]
    property automation : MaintenanceWindowAutomationParameters | Nil

    # The parameters for a `STEP_FUNCTIONS` task type.
    @[JSON::Field(key: "StepFunctions")]
    property step_functions : MaintenanceWindowStepFunctionsParameters | Nil

    # The parameters for a `LAMBDA` task type.
    @[JSON::Field(key: "Lambda")]
    property lambda : MaintenanceWindowLambdaParameters | Nil

    def initialize(
      @run_command : MaintenanceWindowRunCommandParameters | Nil = nil,
      @automation : MaintenanceWindowAutomationParameters | Nil = nil,
      @step_functions : MaintenanceWindowStepFunctionsParameters | Nil = nil,
      @lambda : MaintenanceWindowLambdaParameters | Nil = nil,
    )
    end
  end
end
