private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Describes plugin details.
  class CommandPlugin
    include JSON::Serializable

    # The name of the plugin. Must be one of the following: `aws:updateAgent`, `aws:domainjoin`,
    # `aws:applications`, `aws:runPowerShellScript`, `aws:psmodule`, `aws:cloudWatch`,
    # `aws:runShellScript`, or `aws:updateSSMAgent`.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The status of this plugin. You can run a document with multiple plugins.
    @[JSON::Field(key: "Status", converter: AS::CommandPluginStatus)]
    property status : CommandPluginStatus | Nil

    # A detailed status of the plugin execution. `StatusDetails` includes more information than Status
    # because it includes states resulting from error and concurrency control parameters.
    # StatusDetails can show different results than Status. For more information about these statuses,
    # see [Understanding command
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
    # one or more plugins wasn't zero. Invocation failures count against the MaxErrors limit of the
    # parent command. This is a terminal state.
    #
    # - Cancelled: The command was terminated before it was completed. This is a terminal state.
    #
    # - Undeliverable: The command can't be delivered to the managed node. The managed node might not
    # exist, or it might not be responding. Undeliverable invocations don't count against the parent
    # command's MaxErrors limit, and they don't contribute to whether the parent command status is
    # Success or Incomplete. This is a terminal state.
    #
    # - Terminated: The parent command exceeded its MaxErrors limit and subsequent command invocations
    # were canceled by the system. This is a terminal state.
    @[JSON::Field(key: "StatusDetails")]
    property status_details : String | Nil

    # A numeric response code generated after running the plugin.
    @[JSON::Field(key: "ResponseCode")]
    property response_code : Int32 | Nil

    # The time the plugin started running.
    @[JSON::Field(key: "ResponseStartDateTime", converter: Core::AWSEpochConverter)]
    property response_start_date_time : Time | Nil

    # The time the plugin stopped running. Could stop prematurely if, for example, a cancel command
    # was sent.
    @[JSON::Field(key: "ResponseFinishDateTime", converter: Core::AWSEpochConverter)]
    property response_finish_date_time : Time | Nil

    # Output of the plugin execution.
    @[JSON::Field(key: "Output")]
    property output : String | Nil

    # The URL for the complete text written by the plugin to stdout in Amazon S3. If the S3 bucket for
    # the command wasn't specified, then this string is empty.
    @[JSON::Field(key: "StandardOutputUrl")]
    property standard_output_url : String | Nil

    # The URL for the complete text written by the plugin to stderr. If execution isn't yet complete,
    # then this string is empty.
    @[JSON::Field(key: "StandardErrorUrl")]
    property standard_error_url : String | Nil

    # (Deprecated) You can no longer specify this parameter. The system ignores it. Instead, Amazon
    # Web Services Systems Manager automatically determines the S3 bucket region.
    @[JSON::Field(key: "OutputS3Region")]
    property output_s3_region : String | Nil

    # The S3 bucket where the responses to the command executions should be stored. This was requested
    # when issuing the command. For example, in the following response:
    #
    # `amzn-s3-demo-bucket/my-prefix/i-02573cafcfEXAMPLE/awsrunShellScript`
    #
    # `amzn-s3-demo-bucket` is the name of the S3 bucket;
    #
    # `my-prefix` is the name of the S3 prefix;
    #
    # `i-02573cafcfEXAMPLE` is the managed node ID;
    #
    # `awsrunShellScript` is the name of the plugin.
    @[JSON::Field(key: "OutputS3BucketName")]
    property output_s3_bucket_name : String | Nil

    # The S3 directory path inside the bucket where the responses to the command executions should be
    # stored. This was requested when issuing the command. For example, in the following response:
    #
    # `amzn-s3-demo-bucket/my-prefix/i-02573cafcfEXAMPLE/awsrunShellScript`
    #
    # `amzn-s3-demo-bucket` is the name of the S3 bucket;
    #
    # `my-prefix` is the name of the S3 prefix;
    #
    # `i-02573cafcfEXAMPLE` is the managed node ID;
    #
    # `awsrunShellScript` is the name of the plugin.
    @[JSON::Field(key: "OutputS3KeyPrefix")]
    property output_s3_key_prefix : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @status : CommandPluginStatus | Nil = nil,
      @status_details : String | Nil = nil,
      @response_code : Int32 | Nil = nil,
      @response_start_date_time : Time | Nil = nil,
      @response_finish_date_time : Time | Nil = nil,
      @output : String | Nil = nil,
      @standard_output_url : String | Nil = nil,
      @standard_error_url : String | Nil = nil,
      @output_s3_region : String | Nil = nil,
      @output_s3_bucket_name : String | Nil = nil,
      @output_s3_key_prefix : String | Nil = nil,
    )
    end

    def_equals_and_hash(@name, @status, @status_details, @response_code, @response_start_date_time, @response_finish_date_time, @output, @standard_output_url, @standard_error_url, @output_s3_region, @output_s3_bucket_name, @output_s3_key_prefix)
  end
end
