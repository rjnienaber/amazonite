private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Describes a command request.
  class Command
    include JSON::Serializable

    # A unique identifier for this command.
    @[JSON::Field(key: "CommandId")]
    property command_id : String | Nil

    # The name of the document requested for execution.
    @[JSON::Field(key: "DocumentName")]
    property document_name : String | Nil

    # The Systems Manager document (SSM document) version.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # User-specified information about the command, such as a brief description of what the command
    # should do.
    @[JSON::Field(key: "Comment")]
    property comment : String | Nil

    # If a command expires, it changes status to `DeliveryTimedOut` for all invocations that have the
    # status `InProgress`, `Pending`, or `Delayed`. `ExpiresAfter` is calculated based on the total
    # timeout for the overall command. For more information, see [Understanding command timeout
    # values](https://docs.aws.amazon.com/systems-manager/latest/userguide/monitor-commands.html?icmpid=docs_ec2_console#monitor-about-status-timeouts)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "ExpiresAfter", converter: Core::AWSEpochConverter)]
    property expires_after : Time | Nil

    # The parameter values to be inserted in the document when running the command.
    @[JSON::Field(key: "Parameters")]
    property parameters : Hash(String, Array(String)) | Nil

    # The managed node IDs against which this command was requested.
    @[JSON::Field(key: "InstanceIds")]
    property instance_ids : Array(String) | Nil

    # An array of search criteria that targets managed nodes using a Key,Value combination that you
    # specify. Targets is required if you don't provide one or more managed node IDs in the call.
    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    # The date and time the command was requested.
    @[JSON::Field(key: "RequestedDateTime", converter: Core::AWSEpochConverter)]
    property requested_date_time : Time | Nil

    # The status of the command.
    @[JSON::Field(key: "Status", converter: AS::CommandStatus)]
    property status : CommandStatus | Nil

    # A detailed status of the command execution. `StatusDetails` includes more information than
    # `Status` because it includes states resulting from error and concurrency control parameters.
    # `StatusDetails` can show different results than Status. For more information about these
    # statuses, see [Understanding command
    # statuses](https://docs.aws.amazon.com/systems-manager/latest/userguide/monitor-commands.html) in
    # the *Amazon Web Services Systems Manager User Guide*. StatusDetails can be one of the following
    # values:
    #
    # - Pending: The command hasn't been sent to any managed nodes.
    #
    # - In Progress: The command has been sent to at least one managed node but hasn't reached a final
    # state on all managed nodes.
    #
    # - Success: The command successfully ran on all invocations. This is a terminal state.
    #
    # - Delivery Timed Out: The value of MaxErrors or more command invocations shows a status of
    # Delivery Timed Out. This is a terminal state.
    #
    # - Execution Timed Out: The value of MaxErrors or more command invocations shows a status of
    # Execution Timed Out. This is a terminal state.
    #
    # - Failed: The value of MaxErrors or more command invocations shows a status of Failed. This is a
    # terminal state.
    #
    # - Incomplete: The command was attempted on all managed nodes and one or more invocations doesn't
    # have a value of Success but not enough invocations failed for the status to be Failed. This is a
    # terminal state.
    #
    # - Cancelled: The command was terminated before it was completed. This is a terminal state.
    #
    # - Rate Exceeded: The number of managed nodes targeted by the command exceeded the account limit
    # for pending invocations. The system has canceled the command before running it on any managed
    # node. This is a terminal state.
    #
    # - Delayed: The system attempted to send the command to the managed node but wasn't successful.
    # The system retries again.
    @[JSON::Field(key: "StatusDetails")]
    property status_details : String | Nil

    # (Deprecated) You can no longer specify this parameter. The system ignores it. Instead, Systems
    # Manager automatically determines the Amazon Web Services Region of the S3 bucket.
    @[JSON::Field(key: "OutputS3Region")]
    property output_s3_region : String | Nil

    # The S3 bucket where the responses to the command executions should be stored. This was requested
    # when issuing the command.
    @[JSON::Field(key: "OutputS3BucketName")]
    property output_s3_bucket_name : String | Nil

    # The S3 directory path inside the bucket where the responses to the command executions should be
    # stored. This was requested when issuing the command.
    @[JSON::Field(key: "OutputS3KeyPrefix")]
    property output_s3_key_prefix : String | Nil

    # The maximum number of managed nodes that are allowed to run the command at the same time. You
    # can specify a number of managed nodes, such as 10, or a percentage of nodes, such as 10%. The
    # default value is 50. For more information about how to use `MaxConcurrency`, see [Amazon Web
    # Services Systems Manager Run
    # Command](https://docs.aws.amazon.com/systems-manager/latest/userguide/run-command.html) in the
    # *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "MaxConcurrency")]
    property max_concurrency : String | Nil

    # The maximum number of errors allowed before the system stops sending the command to additional
    # targets. You can specify a number of errors, such as 10, or a percentage or errors, such as 10%.
    # The default value is `0`. For more information about how to use `MaxErrors`, see [Amazon Web
    # Services Systems Manager Run
    # Command](https://docs.aws.amazon.com/systems-manager/latest/userguide/run-command.html) in the
    # *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "MaxErrors")]
    property max_errors : String | Nil

    # The number of targets for the command.
    @[JSON::Field(key: "TargetCount")]
    property target_count : Int32 | Nil

    # The number of targets for which the command invocation reached a terminal state. Terminal states
    # include the following: Success, Failed, Execution Timed Out, Delivery Timed Out, Cancelled,
    # Terminated, or Undeliverable.
    @[JSON::Field(key: "CompletedCount")]
    property completed_count : Int32 | Nil

    # The number of targets for which the status is Failed or Execution Timed Out.
    @[JSON::Field(key: "ErrorCount")]
    property error_count : Int32 | Nil

    # The number of targets for which the status is Delivery Timed Out.
    @[JSON::Field(key: "DeliveryTimedOutCount")]
    property delivery_timed_out_count : Int32 | Nil

    # The Identity and Access Management (IAM) service role that Run Command, a tool in Amazon Web
    # Services Systems Manager, uses to act on your behalf when sending notifications about command
    # status changes.
    @[JSON::Field(key: "ServiceRole")]
    property service_role : String | Nil

    # Configurations for sending notifications about command status changes.
    @[JSON::Field(key: "NotificationConfig")]
    property notification_config : NotificationConfig | Nil

    # Amazon CloudWatch Logs information where you want Amazon Web Services Systems Manager to send
    # the command output.
    @[JSON::Field(key: "CloudWatchOutputConfig")]
    property cloud_watch_output_config : CloudWatchOutputConfig | Nil

    # The `TimeoutSeconds` value specified for a command.
    @[JSON::Field(key: "TimeoutSeconds")]
    property timeout_seconds : Int32 | Nil

    # The details for the CloudWatch alarm applied to your command.
    @[JSON::Field(key: "AlarmConfiguration")]
    property alarm_configuration : AlarmConfiguration | Nil

    # The CloudWatch alarm that was invoked by the command.
    @[JSON::Field(key: "TriggeredAlarms")]
    property triggered_alarms : Array(AlarmStateInformation) | Nil

    def initialize(
      @command_id : String | Nil = nil,
      @document_name : String | Nil = nil,
      @document_version : String | Nil = nil,
      @comment : String | Nil = nil,
      @expires_after : Time | Nil = nil,
      @parameters : Hash(String, Array(String)) | Nil = nil,
      @instance_ids : Array(String) | Nil = nil,
      @targets : Array(Target) | Nil = nil,
      @requested_date_time : Time | Nil = nil,
      @status : CommandStatus | Nil = nil,
      @status_details : String | Nil = nil,
      @output_s3_region : String | Nil = nil,
      @output_s3_bucket_name : String | Nil = nil,
      @output_s3_key_prefix : String | Nil = nil,
      @max_concurrency : String | Nil = nil,
      @max_errors : String | Nil = nil,
      @target_count : Int32 | Nil = nil,
      @completed_count : Int32 | Nil = nil,
      @error_count : Int32 | Nil = nil,
      @delivery_timed_out_count : Int32 | Nil = nil,
      @service_role : String | Nil = nil,
      @notification_config : NotificationConfig | Nil = nil,
      @cloud_watch_output_config : CloudWatchOutputConfig | Nil = nil,
      @timeout_seconds : Int32 | Nil = nil,
      @alarm_configuration : AlarmConfiguration | Nil = nil,
      @triggered_alarms : Array(AlarmStateInformation) | Nil = nil,
    )
    end

    def_equals_and_hash(@command_id, @document_name, @document_version, @comment, @expires_after, @parameters, @instance_ids, @targets, @requested_date_time, @status, @status_details, @output_s3_region, @output_s3_bucket_name, @output_s3_key_prefix, @max_concurrency, @max_errors, @target_count, @completed_count, @error_count, @delivery_timed_out_count, @service_role, @notification_config, @cloud_watch_output_config, @timeout_seconds, @alarm_configuration, @triggered_alarms)
  end
end
