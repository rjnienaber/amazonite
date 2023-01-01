private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class GetCommandInvocationResult
    include JSON::Serializable

    @[JSON::Field(key: "CommandId")]
    property command_id : String | Nil

    @[JSON::Field(key: "InstanceId")]
    property instance_id : String | Nil

    @[JSON::Field(key: "Comment")]
    property comment : String | Nil

    @[JSON::Field(key: "DocumentName")]
    property document_name : String | Nil

    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    @[JSON::Field(key: "PluginName")]
    property plugin_name : String | Nil

    @[JSON::Field(key: "ResponseCode")]
    property response_code : Int32 | Nil

    @[JSON::Field(key: "ExecutionStartDateTime")]
    property execution_start_date_time : String | Nil

    @[JSON::Field(key: "ExecutionElapsedTime")]
    property execution_elapsed_time : String | Nil

    @[JSON::Field(key: "ExecutionEndDateTime")]
    property execution_end_date_time : String | Nil

    @[JSON::Field(key: "Status", converter: AS::CommandInvocationStatus)]
    property status : CommandInvocationStatus | Nil

    @[JSON::Field(key: "StatusDetails")]
    property status_details : String | Nil

    @[JSON::Field(key: "StandardOutputContent")]
    property standard_output_content : String | Nil

    @[JSON::Field(key: "StandardOutputUrl")]
    property standard_output_url : String | Nil

    @[JSON::Field(key: "StandardErrorContent")]
    property standard_error_content : String | Nil

    @[JSON::Field(key: "StandardErrorUrl")]
    property standard_error_url : String | Nil

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
      @cloud_watch_output_config : CloudWatchOutputConfig | Nil = nil
    )
    end
  end
end
