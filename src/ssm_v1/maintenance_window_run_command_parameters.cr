private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  # The parameters for a `RUN_COMMAND` task type.
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
  # For `RUN_COMMAND` tasks, Systems Manager uses specified values for `TaskParameters` and
  # `LoggingInfo` only if no values are specified for `TaskInvocationParameters`.
  class MaintenanceWindowRunCommandParameters
    include JSON::Serializable

    # Information about the commands to run.
    @[JSON::Field(key: "Comment")]
    property comment : String | Nil

    @[JSON::Field(key: "CloudWatchOutputConfig")]
    property cloud_watch_output_config : CloudWatchOutputConfig | Nil

    # The SHA-256 or SHA-1 hash created by the system when the document was created. SHA-1 hashes have
    # been deprecated.
    @[JSON::Field(key: "DocumentHash")]
    property document_hash : String | Nil

    # SHA-256 or SHA-1. SHA-1 hashes have been deprecated.
    @[JSON::Field(key: "DocumentHashType", converter: AS::DocumentHashType)]
    property document_hash_type : DocumentHashType | Nil

    # The Amazon Web Services Systems Manager document (SSM document) version to use in the request.
    # You can specify `$DEFAULT`, `$LATEST`, or a specific version number. If you run commands by
    # using the Amazon Web Services CLI, then you must escape the first two options by using a
    # backslash. If you specify a version number, then you don't need to use the backslash. For
    # example:
    #
    # `--document-version "\$DEFAULT"`
    #
    # `--document-version "\$LATEST"`
    #
    # `--document-version "3"`
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # Configurations for sending notifications about command status changes on a per-managed node
    # basis.
    @[JSON::Field(key: "NotificationConfig")]
    property notification_config : NotificationConfig | Nil

    # The name of the Amazon Simple Storage Service (Amazon S3) bucket.
    @[JSON::Field(key: "OutputS3BucketName")]
    property output_s3_bucket_name : String | Nil

    # The S3 bucket subfolder.
    @[JSON::Field(key: "OutputS3KeyPrefix")]
    property output_s3_key_prefix : String | Nil

    # The parameters for the `RUN_COMMAND` task execution.
    @[JSON::Field(key: "Parameters")]
    property parameters : Hash(String, Array(String)) | Nil

    # The Amazon Resource Name (ARN) of the IAM service role for Amazon Web Services Systems Manager
    # to assume when running a maintenance window task. If you do not specify a service role ARN,
    # Systems Manager uses a service-linked role in your account. If no appropriate service-linked
    # role for Systems Manager exists in your account, it is created when you run
    # `RegisterTaskWithMaintenanceWindow`.
    #
    # However, for an improved security posture, we strongly recommend creating a custom policy and
    # custom service role for running your maintenance window tasks. The policy can be crafted to
    # provide only the permissions needed for your particular maintenance window tasks. For more
    # information, see [Setting up Maintenance
    # Windows](https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-maintenance-permissions.html)
    # in the in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "ServiceRoleArn")]
    property service_role_arn : String | Nil

    # If this time is reached and the command hasn't already started running, it doesn't run.
    @[JSON::Field(key: "TimeoutSeconds")]
    property timeout_seconds : Int32 | Nil

    def initialize(
      @comment : String | Nil = nil,
      @cloud_watch_output_config : CloudWatchOutputConfig | Nil = nil,
      @document_hash : String | Nil = nil,
      @document_hash_type : DocumentHashType | Nil = nil,
      @document_version : String | Nil = nil,
      @notification_config : NotificationConfig | Nil = nil,
      @output_s3_bucket_name : String | Nil = nil,
      @output_s3_key_prefix : String | Nil = nil,
      @parameters : Hash(String, Array(String)) | Nil = nil,
      @service_role_arn : String | Nil = nil,
      @timeout_seconds : Int32 | Nil = nil,
    )
    end

    def_equals_and_hash(@comment, @cloud_watch_output_config, @document_hash, @document_hash_type, @document_version, @notification_config, @output_s3_bucket_name, @output_s3_key_prefix, @parameters, @service_role_arn, @timeout_seconds)
  end
end
