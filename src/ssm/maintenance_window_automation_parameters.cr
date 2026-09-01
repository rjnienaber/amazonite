private alias Core = Amazonite::Core

module Amazonite::Ssm
  # The parameters for an `AUTOMATION` task type.
  class MaintenanceWindowAutomationParameters
    include JSON::Serializable

    # The version of an Automation runbook to use during task execution.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # The parameters for the `AUTOMATION` task.
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
    # For `AUTOMATION` task types, Amazon Web Services Systems Manager ignores any values specified
    # for these parameters.
    @[JSON::Field(key: "Parameters")]
    property parameters : Hash(String, Array(String)) | Nil

    def initialize(
      @document_version : String | Nil = nil,
      @parameters : Hash(String, Array(String)) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @document_version
        raise Core::ValidationError.new("DocumentVersion does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)$"))
      end

      if value = @parameters
        raise Core::ValidationError.new("Parameters must have at least 1 entry(s)") if value.size < 1
        raise Core::ValidationError.new("Parameters must have at most 200 entry(s)") if value.size > 200
      end
    end

    def_equals_and_hash(@document_version, @parameters)
  end
end
