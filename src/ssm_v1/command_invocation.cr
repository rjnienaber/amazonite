private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class CommandInvocation
    include JSON::Serializable

    @[JSON::Field(key: "CommandId")]
    property command_id : String | Nil

    @[JSON::Field(key: "InstanceId")]
    property instance_id : String | Nil

    @[JSON::Field(key: "InstanceName")]
    property instance_name : String | Nil

    @[JSON::Field(key: "Comment")]
    property comment : String | Nil

    @[JSON::Field(key: "DocumentName")]
    property document_name : String | Nil

    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    @[JSON::Field(key: "RequestedDateTime", converter: Core::AWSEpochConverter)]
    property requested_date_time : Time | Nil

    @[JSON::Field(key: "Status", converter: AS::CommandInvocationStatus)]
    property status : CommandInvocationStatus | Nil

    @[JSON::Field(key: "StatusDetails")]
    property status_details : String | Nil

    @[JSON::Field(key: "TraceOutput")]
    property trace_output : String | Nil

    @[JSON::Field(key: "StandardOutputUrl")]
    property standard_output_url : String | Nil

    @[JSON::Field(key: "StandardErrorUrl")]
    property standard_error_url : String | Nil

    @[JSON::Field(key: "CommandPlugins")]
    property command_plugins : Array(CommandPlugin) | Nil

    @[JSON::Field(key: "ServiceRole")]
    property service_role : String | Nil

    @[JSON::Field(key: "NotificationConfig")]
    property notification_config : NotificationConfig | Nil

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
      @cloud_watch_output_config : CloudWatchOutputConfig | Nil = nil
    )
    end
  end
end
