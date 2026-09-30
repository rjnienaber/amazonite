private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
  # An invocation is a copy of a command sent to a specific managed node. A command can apply to one
  # or more managed nodes. A command invocation applies to one managed node. For example, if a user
  # runs `SendCommand` against three managed nodes, then a command invocation is created for each
  # requested managed node ID. A command invocation returns status and detail information about a
  # command you ran.
  class CommandInvocation
    include JSON::Serializable

    # The command against which this invocation was requested.
    @[JSON::Field(key: "CommandId")]
    property command_id : String | Nil

    # The managed node ID in which this invocation was requested.
    @[JSON::Field(key: "InstanceId")]
    property instance_id : String | Nil

    # The fully qualified host name of the managed node.
    @[JSON::Field(key: "InstanceName")]
    property instance_name : String | Nil

    # User-specified information about the command, such as a brief description of what the command
    # should do.
    @[JSON::Field(key: "Comment")]
    property comment : String | Nil

    # The document name that was requested for execution.
    @[JSON::Field(key: "DocumentName")]
    property document_name : String | Nil

    # The Systems Manager document (SSM document) version.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # The time and date the request was sent to this managed node.
    @[JSON::Field(key: "RequestedDateTime", converter: Core::AWSEpochConverter)]
    property requested_date_time : Time | Nil

    # Whether or not the invocation succeeded, failed, or is pending.
    @[JSON::Field(key: "Status", converter: AS::CommandInvocationStatus)]
    property status : CommandInvocationStatus | Nil

    # A detailed status of the command execution for each invocation (each managed node targeted by
    # the command). StatusDetails includes more information than Status because it includes states
    # resulting from error and concurrency control parameters. StatusDetails can show different
    # results than Status. For more information about these statuses, see [Understanding command
    # statuses](https://docs.aws.amazon.com/systems-manager/latest/userguide/monitor-commands.html) in
    # the *Amazon Web Services Systems Manager User Guide*. StatusDetails can be one of the following
    # values:
    #
    # - Pending: The command hasn't been sent to the managed node.
    #
    # - In Progress: The command has been sent to the managed node but hasn't reached a terminal
    # state.
    #
    # - Success: The execution of the command or plugin was successfully completed. This is a terminal
    # state.
    #
    # - Delivery Timed Out: The command wasn't delivered to the managed node before the delivery
    # timeout expired. Delivery timeouts don't count against the parent command's `MaxErrors` limit,
    # but they do contribute to whether the parent command status is Success or Incomplete. This is a
    # terminal state.
    #
    # - Execution Timed Out: Command execution started on the managed node, but the execution wasn't
    # complete before the execution timeout expired. Execution timeouts count against the `MaxErrors`
    # limit of the parent command. This is a terminal state.
    #
    # - Failed: The command wasn't successful on the managed node. For a plugin, this indicates that
    # the result code wasn't zero. For a command invocation, this indicates that the result code for
    # one or more plugins wasn't zero. Invocation failures count against the `MaxErrors` limit of the
    # parent command. This is a terminal state.
    #
    # - Cancelled: The command was terminated before it was completed. This is a terminal state.
    #
    # - Undeliverable: The command can't be delivered to the managed node. The managed node might not
    # exist or might not be responding. Undeliverable invocations don't count against the parent
    # command's MaxErrors limit and don't contribute to whether the parent command status is Success
    # or Incomplete. This is a terminal state.
    #
    # - Terminated: The parent command exceeded its MaxErrors limit and subsequent command invocations
    # were canceled by the system. This is a terminal state.
    #
    # - Delayed: The system attempted to send the command to the managed node but wasn't successful.
    # The system retries again.
    @[JSON::Field(key: "StatusDetails")]
    property status_details : String | Nil

    # Gets the trace output sent by the agent.
    @[JSON::Field(key: "TraceOutput")]
    property trace_output : String | Nil

    # The URL to the plugin's StdOut file in Amazon Simple Storage Service (Amazon S3), if the S3
    # bucket was defined for the parent command. For an invocation, `StandardOutputUrl` is populated
    # if there is just one plugin defined for the command, and the S3 bucket was defined for the
    # command.
    @[JSON::Field(key: "StandardOutputUrl")]
    property standard_output_url : String | Nil

    # The URL to the plugin's StdErr file in Amazon Simple Storage Service (Amazon S3), if the S3
    # bucket was defined for the parent command. For an invocation, `StandardErrorUrl` is populated if
    # there is just one plugin defined for the command, and the S3 bucket was defined for the command.
    @[JSON::Field(key: "StandardErrorUrl")]
    property standard_error_url : String | Nil

    # Plugins processed by the command.
    @[JSON::Field(key: "CommandPlugins")]
    property command_plugins : Array(CommandPlugin) | Nil

    # The Identity and Access Management (IAM) service role that Run Command, a tool in Amazon Web
    # Services Systems Manager, uses to act on your behalf when sending notifications about command
    # status changes on a per managed node basis.
    @[JSON::Field(key: "ServiceRole")]
    property service_role : String | Nil

    # Configurations for sending notifications about command status changes on a per managed node
    # basis.
    @[JSON::Field(key: "NotificationConfig")]
    property notification_config : NotificationConfig | Nil

    # Amazon CloudWatch Logs information where you want Amazon Web Services Systems Manager to send
    # the command output.
    @[JSON::Field(key: "CloudWatchOutputConfig")]
    property cloud_watch_output_config : CloudWatchOutputConfig | Nil

    def initialize(
      @command_id : String | Nil = nil,
      @instance_id : String | Nil = nil,
      @instance_name : String | Nil = nil,
      @comment : String | Nil = nil,
      @document_name : String | Nil = nil,
      @document_version : String | Nil = nil,
      @requested_date_time : Time | Nil = nil,
      @status : CommandInvocationStatus | Nil = nil,
      @status_details : String | Nil = nil,
      @trace_output : String | Nil = nil,
      @standard_output_url : String | Nil = nil,
      @standard_error_url : String | Nil = nil,
      @command_plugins : Array(CommandPlugin) | Nil = nil,
      @service_role : String | Nil = nil,
      @notification_config : NotificationConfig | Nil = nil,
      @cloud_watch_output_config : CloudWatchOutputConfig | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @command_id
        raise Core::ValidationError.new("CommandId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("CommandId length must be <= 36") if value.size > 36
      end

      if value = @instance_id
        raise Core::ValidationError.new("InstanceId does not match the required pattern") unless value.matches?(Regex.new("^(^i-(\\w{8}|\\w{17})$)|(^mi-\\w{17}$)$"))
      end

      if value = @instance_name
        raise Core::ValidationError.new("InstanceName length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("InstanceName length must be <= 255") if value.size > 255
      end

      if value = @comment
        raise Core::ValidationError.new("Comment length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Comment length must be <= 100") if value.size > 100
      end

      if value = @document_name
        raise Core::ValidationError.new("DocumentName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{3,128}$"))
      end

      if value = @document_version
        raise Core::ValidationError.new("DocumentVersion does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)$"))
      end

      if value = @status_details
        raise Core::ValidationError.new("StatusDetails length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("StatusDetails length must be <= 100") if value.size > 100
      end

      if value = @trace_output
        raise Core::ValidationError.new("TraceOutput length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("TraceOutput length must be <= 2500") if value.size > 2500
      end

      if value = @command_plugins
        value.each(&.validate!)
      end

      if value = @notification_config
        value.validate!
      end

      if value = @cloud_watch_output_config
        value.validate!
      end
    end

    def_equals_and_hash(@command_id, @instance_id, @instance_name, @comment, @document_name, @document_version, @requested_date_time, @status, @status_details, @trace_output, @standard_output_url, @standard_error_url, @command_plugins, @service_role, @notification_config, @cloud_watch_output_config)
  end
end
