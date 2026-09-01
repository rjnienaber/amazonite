private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
  class GetCommandInvocationResult
    include JSON::Serializable

    # The parent command ID of the invocation plugin.
    @[JSON::Field(key: "CommandId")]
    property command_id : String | Nil

    # The ID of the managed node targeted by the command. A *managed node* can be an Amazon Elastic
    # Compute Cloud (Amazon EC2) instance, edge device, or on-premises server or VM in your hybrid
    # environment that is configured for Amazon Web Services Systems Manager.
    @[JSON::Field(key: "InstanceId")]
    property instance_id : String | Nil

    # The comment text for the command.
    @[JSON::Field(key: "Comment")]
    property comment : String | Nil

    # The name of the document that was run. For example, `AWS-RunShellScript`.
    @[JSON::Field(key: "DocumentName")]
    property document_name : String | Nil

    # The Systems Manager document (SSM document) version used in the request.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # The name of the plugin, or *step name*, for which details are reported. For example,
    # `aws:RunShellScript` is a plugin.
    @[JSON::Field(key: "PluginName")]
    property plugin_name : String | Nil

    # The error level response code for the plugin script. If the response code is `-1`, then the
    # command hasn't started running on the managed node, or it wasn't received by the node.
    @[JSON::Field(key: "ResponseCode")]
    property response_code : Int32 | Nil

    # The date and time the plugin started running. Date and time are written in ISO 8601 format. For
    # example, June 7, 2017 is represented as 2017-06-7. The following sample Amazon Web Services CLI
    # command uses the `InvokedBefore` filter.
    #
    # `aws ssm list-commands --filters key=InvokedBefore,value=2017-06-07T00:00:00Z`
    #
    # If the plugin hasn't started to run, the string is empty.
    @[JSON::Field(key: "ExecutionStartDateTime")]
    property execution_start_date_time : String | Nil

    # Duration since `ExecutionStartDateTime`.
    @[JSON::Field(key: "ExecutionElapsedTime")]
    property execution_elapsed_time : String | Nil

    # The date and time the plugin finished running. Date and time are written in ISO 8601 format. For
    # example, June 7, 2017 is represented as 2017-06-7. The following sample Amazon Web Services CLI
    # command uses the `InvokedAfter` filter.
    #
    # `aws ssm list-commands --filters key=InvokedAfter,value=2017-06-07T00:00:00Z`
    #
    # If the plugin hasn't started to run, the string is empty.
    @[JSON::Field(key: "ExecutionEndDateTime")]
    property execution_end_date_time : String | Nil

    # The status of this invocation plugin. This status can be different than `StatusDetails`.
    @[JSON::Field(key: "Status", converter: AS::CommandInvocationStatus)]
    property status : CommandInvocationStatus | Nil

    # A detailed status of the command execution for an invocation. `StatusDetails` includes more
    # information than `Status` because it includes states resulting from error and concurrency
    # control parameters. `StatusDetails` can show different results than `Status`. For more
    # information about these statuses, see [Understanding command
    # statuses](https://docs.aws.amazon.com/systems-manager/latest/userguide/monitor-commands.html) in
    # the *Amazon Web Services Systems Manager User Guide*. `StatusDetails` can be one of the
    # following values:
    #
    # - Pending: The command hasn't been sent to the managed node.
    #
    # - In Progress: The command has been sent to the managed node but hasn't reached a terminal
    # state.
    #
    # - Delayed: The system attempted to send the command to the target, but the target wasn't
    # available. The managed node might not be available because of network issues, because the node
    # was stopped, or for similar reasons. The system will try to send the command again.
    #
    # - Success: The command or plugin ran successfully. This is a terminal state.
    #
    # - Delivery Timed Out: The command wasn't delivered to the managed node before the delivery
    # timeout expired. Delivery timeouts don't count against the parent command's `MaxErrors` limit,
    # but they do contribute to whether the parent command status is Success or Incomplete. This is a
    # terminal state.
    #
    # - Execution Timed Out: The command started to run on the managed node, but the execution wasn't
    # complete before the timeout expired. Execution timeouts count against the `MaxErrors` limit of
    # the parent command. This is a terminal state.
    #
    # - Failed: The command wasn't run successfully on the managed node. For a plugin, this indicates
    # that the result code wasn't zero. For a command invocation, this indicates that the result code
    # for one or more plugins wasn't zero. Invocation failures count against the `MaxErrors` limit of
    # the parent command. This is a terminal state.
    #
    # - Cancelled: The command was terminated before it was completed. This is a terminal state.
    #
    # - Undeliverable: The command can't be delivered to the managed node. The node might not exist or
    # might not be responding. Undeliverable invocations don't count against the parent command's
    # `MaxErrors` limit and don't contribute to whether the parent command status is Success or
    # Incomplete. This is a terminal state.
    #
    # - Terminated: The parent command exceeded its `MaxErrors` limit and subsequent command
    # invocations were canceled by the system. This is a terminal state.
    @[JSON::Field(key: "StatusDetails")]
    property status_details : String | Nil

    # The first 24,000 characters written by the plugin to `stdout`. If the command hasn't finished
    # running, if `ExecutionStatus` is neither Succeeded nor Failed, then this string is empty.
    @[JSON::Field(key: "StandardOutputContent")]
    property standard_output_content : String | Nil

    # The URL for the complete text written by the plugin to `stdout` in Amazon Simple Storage Service
    # (Amazon S3). If an S3 bucket wasn't specified, then this string is empty.
    @[JSON::Field(key: "StandardOutputUrl")]
    property standard_output_url : String | Nil

    # The first 8,000 characters written by the plugin to `stderr`. If the command hasn't finished
    # running, then this string is empty.
    @[JSON::Field(key: "StandardErrorContent")]
    property standard_error_content : String | Nil

    # The URL for the complete text written by the plugin to `stderr`. If the command hasn't finished
    # running, then this string is empty.
    @[JSON::Field(key: "StandardErrorUrl")]
    property standard_error_url : String | Nil

    # Amazon CloudWatch Logs information where Systems Manager sent the command output.
    @[JSON::Field(key: "CloudWatchOutputConfig")]
    property cloud_watch_output_config : CloudWatchOutputConfig | Nil

    def initialize(
      @command_id : String | Nil = nil,
      @instance_id : String | Nil = nil,
      @comment : String | Nil = nil,
      @document_name : String | Nil = nil,
      @document_version : String | Nil = nil,
      @plugin_name : String | Nil = nil,
      @response_code : Int32 | Nil = nil,
      @execution_start_date_time : String | Nil = nil,
      @execution_elapsed_time : String | Nil = nil,
      @execution_end_date_time : String | Nil = nil,
      @status : CommandInvocationStatus | Nil = nil,
      @status_details : String | Nil = nil,
      @standard_output_content : String | Nil = nil,
      @standard_output_url : String | Nil = nil,
      @standard_error_content : String | Nil = nil,
      @standard_error_url : String | Nil = nil,
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

      if value = @plugin_name
        raise Core::ValidationError.new("PluginName length must be >= 4") if value.size < 4
      end

      if value = @execution_start_date_time
        raise Core::ValidationError.new("ExecutionStartDateTime does not match the required pattern") unless value.matches?(Regex.new("^([\\-]?\\d{4}(?!\\d{2}\\b))((-?)((0[1-9]|1[0-2])(\\3([12]\\d|0[1-9]|3[01]))?|W([0-4]\\d|5[0-2])(-?[1-7])?|(00[1-9]|0[1-9]\\d|[12]\\d{2}|3([0-5]\\d|6[1-6])))([T\\s]((([01]\\d|2[0-3])((:?)[0-5]\\d)?|24\\:?00)([\\.,]\\d(?!:))?)?(\\17[0-5]\\d([\\.,]\\d)?)?([zZ]|([\\-])([01]\\d|2[0-3]):?([0-5]\\d)?)?)?)?$"))
      end

      if value = @execution_elapsed_time
        raise Core::ValidationError.new("ExecutionElapsedTime does not match the required pattern") unless value.matches?(Regex.new("^([\\-]?\\d{4}(?!\\d{2}\\b))((-?)((0[1-9]|1[0-2])(\\3([12]\\d|0[1-9]|3[01]))?|W([0-4]\\d|5[0-2])(-?[1-7])?|(00[1-9]|0[1-9]\\d|[12]\\d{2}|3([0-5]\\d|6[1-6])))([T\\s]((([01]\\d|2[0-3])((:?)[0-5]\\d)?|24\\:?00)([\\.,]\\d(?!:))?)?(\\17[0-5]\\d([\\.,]\\d)?)?([zZ]|([\\-])([01]\\d|2[0-3]):?([0-5]\\d)?)?)?)?$"))
      end

      if value = @execution_end_date_time
        raise Core::ValidationError.new("ExecutionEndDateTime does not match the required pattern") unless value.matches?(Regex.new("^([\\-]?\\d{4}(?!\\d{2}\\b))((-?)((0[1-9]|1[0-2])(\\3([12]\\d|0[1-9]|3[01]))?|W([0-4]\\d|5[0-2])(-?[1-7])?|(00[1-9]|0[1-9]\\d|[12]\\d{2}|3([0-5]\\d|6[1-6])))([T\\s]((([01]\\d|2[0-3])((:?)[0-5]\\d)?|24\\:?00)([\\.,]\\d(?!:))?)?(\\17[0-5]\\d([\\.,]\\d)?)?([zZ]|([\\-])([01]\\d|2[0-3]):?([0-5]\\d)?)?)?)?$"))
      end

      if value = @status_details
        raise Core::ValidationError.new("StatusDetails length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("StatusDetails length must be <= 100") if value.size > 100
      end

      if value = @standard_output_content
        raise Core::ValidationError.new("StandardOutputContent length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("StandardOutputContent length must be <= 24000") if value.size > 24000
      end

      if value = @standard_error_content
        raise Core::ValidationError.new("StandardErrorContent length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("StandardErrorContent length must be <= 8000") if value.size > 8000
      end

      if value = @cloud_watch_output_config
        value.validate!
      end
    end

    def_equals_and_hash(@command_id, @instance_id, @comment, @document_name, @document_version, @plugin_name, @response_code, @execution_start_date_time, @execution_elapsed_time, @execution_end_date_time, @status, @status_details, @standard_output_content, @standard_output_url, @standard_error_content, @standard_error_url, @cloud_watch_output_config)
  end
end
