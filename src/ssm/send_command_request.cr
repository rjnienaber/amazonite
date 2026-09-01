private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
  class SendCommandRequest
    include JSON::Serializable

    # The IDs of the managed nodes where the command should run. Specifying managed node IDs is most
    # useful when you are targeting a limited number of managed nodes, though you can specify up to 50
    # IDs.
    #
    # To target a larger number of managed nodes, or if you prefer not to list individual node IDs, we
    # recommend using the `Targets` option instead. Using `Targets`, which accepts tag key-value pairs
    # to identify the managed nodes to send commands to, you can a send command to tens, hundreds, or
    # thousands of nodes at once.
    #
    # For more information about how to use targets, see [Run commands at
    # scale](https://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "InstanceIds")]
    property instance_ids : Array(String) | Nil

    # An array of search criteria that targets managed nodes using a `Key,Value` combination that you
    # specify. Specifying targets is most useful when you want to send a command to a large number of
    # managed nodes at once. Using `Targets`, which accepts tag key-value pairs to identify managed
    # nodes, you can send a command to tens, hundreds, or thousands of nodes at once.
    #
    # To send a command to a smaller number of managed nodes, you can use the `InstanceIds` option
    # instead.
    #
    # For more information about how to use targets, see [Run commands at
    # scale](https://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    # The name of the Amazon Web Services Systems Manager document (SSM document) to run. This can be
    # a public document or a custom document. To run a shared document belonging to another account,
    # specify the document Amazon Resource Name (ARN). For more information about how to use shared
    # documents, see [Sharing SSM
    # documents](https://docs.aws.amazon.com/systems-manager/latest/userguide/ssm-using-shared.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    #
    # If you specify a document name or ARN that hasn't been shared with your account, you receive an
    # `InvalidDocument` error.
    @[JSON::Field(key: "DocumentName")]
    property document_name : String

    # The SSM document version to use in the request. You can specify $DEFAULT, $LATEST, or a specific
    # version number. If you run commands by using the Command Line Interface (Amazon Web Services
    # CLI), then you must escape the first two options by using a backslash. If you specify a version
    # number, then you don't need to use the backslash. For example:
    #
    # --document-version "\$DEFAULT"
    #
    # --document-version "\$LATEST"
    #
    # --document-version "3"
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # The Sha256 or Sha1 hash created by the system when the document was created.
    #
    # Sha1 hashes have been deprecated.
    @[JSON::Field(key: "DocumentHash")]
    property document_hash : String | Nil

    # Sha256 or Sha1.
    #
    # Sha1 hashes have been deprecated.
    @[JSON::Field(key: "DocumentHashType", converter: AS::DocumentHashType)]
    property document_hash_type : DocumentHashType | Nil

    # If this time is reached and the command hasn't already started running, it won't run.
    @[JSON::Field(key: "TimeoutSeconds")]
    property timeout_seconds : Int32 | Nil

    # User-specified information about the command, such as a brief description of what the command
    # should do.
    @[JSON::Field(key: "Comment")]
    property comment : String | Nil

    # The required and optional parameters specified in the document being run.
    @[JSON::Field(key: "Parameters")]
    property parameters : Hash(String, Array(String)) | Nil

    # (Deprecated) You can no longer specify this parameter. The system ignores it. Instead, Systems
    # Manager automatically determines the Amazon Web Services Region of the S3 bucket.
    @[JSON::Field(key: "OutputS3Region")]
    property output_s3_region : String | Nil

    # The name of the S3 bucket where command execution responses should be stored.
    @[JSON::Field(key: "OutputS3BucketName")]
    property output_s3_bucket_name : String | Nil

    # The directory structure within the S3 bucket where the responses should be stored.
    @[JSON::Field(key: "OutputS3KeyPrefix")]
    property output_s3_key_prefix : String | Nil

    # (Optional) The maximum number of managed nodes that are allowed to run the command at the same
    # time. You can specify a number such as 10 or a percentage such as 10%. The default value is
    # `50`. For more information about how to use `MaxConcurrency`, see [Using concurrency
    # controls](https://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html#send-commands-velocity)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "MaxConcurrency")]
    property max_concurrency : String | Nil

    # The maximum number of errors allowed without the command failing. When the command fails one
    # more time beyond the value of `MaxErrors`, the systems stops sending the command to additional
    # targets. You can specify a number like 10 or a percentage like 10%. The default value is `0`.
    # For more information about how to use `MaxErrors`, see [Using error
    # controls](https://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html#send-commands-maxerrors)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "MaxErrors")]
    property max_errors : String | Nil

    # The ARN of the Identity and Access Management (IAM) service role to use to publish Amazon Simple
    # Notification Service (Amazon SNS) notifications for Run Command commands.
    #
    # This role must provide the `sns:Publish` permission for your notification topic. For information
    # about creating and using this service role, see [Monitoring Systems Manager status changes using
    # Amazon SNS
    # notifications](https://docs.aws.amazon.com/systems-manager/latest/userguide/monitoring-sns-notifications.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "ServiceRoleArn")]
    property service_role_arn : String | Nil

    # Configurations for sending notifications.
    @[JSON::Field(key: "NotificationConfig")]
    property notification_config : NotificationConfig | Nil

    # Enables Amazon Web Services Systems Manager to send Run Command output to Amazon CloudWatch
    # Logs. Run Command is a tool in Amazon Web Services Systems Manager.
    @[JSON::Field(key: "CloudWatchOutputConfig")]
    property cloud_watch_output_config : CloudWatchOutputConfig | Nil

    # The CloudWatch alarm you want to apply to your command.
    @[JSON::Field(key: "AlarmConfiguration")]
    property alarm_configuration : AlarmConfiguration | Nil

    def initialize(
      @document_name : String,
      @instance_ids : Array(String) | Nil = nil,
      @targets : Array(Target) | Nil = nil,
      @document_version : String | Nil = nil,
      @document_hash : String | Nil = nil,
      @document_hash_type : DocumentHashType | Nil = nil,
      @timeout_seconds : Int32 | Nil = nil,
      @comment : String | Nil = nil,
      @parameters : Hash(String, Array(String)) | Nil = nil,
      @output_s3_region : String | Nil = nil,
      @output_s3_bucket_name : String | Nil = nil,
      @output_s3_key_prefix : String | Nil = nil,
      @max_concurrency : String | Nil = nil,
      @max_errors : String | Nil = nil,
      @service_role_arn : String | Nil = nil,
      @notification_config : NotificationConfig | Nil = nil,
      @cloud_watch_output_config : CloudWatchOutputConfig | Nil = nil,
      @alarm_configuration : AlarmConfiguration | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @instance_ids
        raise Core::ValidationError.new("InstanceIds must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("InstanceIds must have at most 50 item(s)") if value.size > 50
      end

      if value = @targets
        raise Core::ValidationError.new("Targets must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Targets must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end

      if value = @document_name
        raise Core::ValidationError.new("DocumentName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.:/]{3,128}$"))
      end

      if value = @document_version
        raise Core::ValidationError.new("DocumentVersion does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)$"))
      end

      if value = @document_hash
        raise Core::ValidationError.new("DocumentHash length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("DocumentHash length must be <= 256") if value.size > 256
      end

      if value = @timeout_seconds
        raise Core::ValidationError.new("TimeoutSeconds value must be >= 30") if value < 30
        raise Core::ValidationError.new("TimeoutSeconds value must be <= 2592000") if value > 2592000
      end

      if value = @comment
        raise Core::ValidationError.new("Comment length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Comment length must be <= 100") if value.size > 100
      end

      if value = @output_s3_region
        raise Core::ValidationError.new("OutputS3Region length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("OutputS3Region length must be <= 20") if value.size > 20
      end

      if value = @output_s3_bucket_name
        raise Core::ValidationError.new("OutputS3BucketName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("OutputS3BucketName length must be <= 63") if value.size > 63
      end

      if value = @output_s3_key_prefix
        raise Core::ValidationError.new("OutputS3KeyPrefix length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("OutputS3KeyPrefix length must be <= 500") if value.size > 500
      end

      if value = @max_concurrency
        raise Core::ValidationError.new("MaxConcurrency length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("MaxConcurrency length must be <= 7") if value.size > 7
        raise Core::ValidationError.new("MaxConcurrency does not match the required pattern") unless value.matches?(Regex.new("^([1-9][0-9]*|[1-9][0-9]%|[1-9]%|100%)$"))
      end

      if value = @max_errors
        raise Core::ValidationError.new("MaxErrors length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("MaxErrors length must be <= 7") if value.size > 7
        raise Core::ValidationError.new("MaxErrors does not match the required pattern") unless value.matches?(Regex.new("^([1-9][0-9]*|[0]|[1-9][0-9]%|[0-9]%|100%)$"))
      end

      if value = @notification_config
        value.validate!
      end

      if value = @cloud_watch_output_config
        value.validate!
      end

      if value = @alarm_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@instance_ids, @targets, @document_name, @document_version, @document_hash, @document_hash_type, @timeout_seconds, @comment, @parameters, @output_s3_region, @output_s3_bucket_name, @output_s3_key_prefix, @max_concurrency, @max_errors, @service_role_arn, @notification_config, @cloud_watch_output_config, @alarm_configuration)
  end
end
