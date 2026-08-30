private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # The parameters for a `STEP_FUNCTIONS` task.
  #
  # For information about specifying and updating task parameters, see
  # RegisterTaskWithMaintenanceWindow and UpdateMaintenanceWindowTask.
  #
  # `LoggingInfo` has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3)
  # bucket to contain logs, instead use the `OutputS3BucketName` and `OutputS3KeyPrefix` options in
  # the `TaskInvocationParameters` structure. For information about how Amazon Web Services Systems
  # Manager handles these options for the supported maintenance window task types, see
  # MaintenanceWindowTaskInvocationParameters.
  #
  # `TaskParameters` has been deprecated. To specify parameters to pass to a task when it runs,
  # instead use the `Parameters` option in the `TaskInvocationParameters` structure. For information
  # about how Systems Manager handles these options for the supported maintenance window task types,
  # see MaintenanceWindowTaskInvocationParameters.
  #
  # For Step Functions tasks, Systems Manager ignores any values specified for `TaskParameters` and
  # `LoggingInfo`.
  class MaintenanceWindowStepFunctionsParameters
    include JSON::Serializable

    # The inputs for the `STEP_FUNCTIONS` task.
    @[JSON::Field(key: "Input")]
    property input : String | Nil

    # The name of the `STEP_FUNCTIONS` task.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    def initialize(
      @input : String | Nil = nil,
      @name : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @input
        raise Core::ValidationError.new("Input length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Input length must be <= 4096") if value.size > 4096
      end

      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 80") if value.size > 80
      end
    end

    def_equals_and_hash(@input, @name)
  end
end
