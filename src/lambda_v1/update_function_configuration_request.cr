private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class UpdateFunctionConfigurationRequest
    include JSON::Serializable

    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    @[JSON::Field(key: "Role")]
    property role : String | Nil

    @[JSON::Field(key: "Handler")]
    property handler : String | Nil

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "Timeout")]
    property timeout : Int32 | Nil

    @[JSON::Field(key: "MemorySize")]
    property memory_size : Int32 | Nil

    @[JSON::Field(key: "VpcConfig")]
    property vpc_config : VpcConfig | Nil

    @[JSON::Field(key: "Environment")]
    property environment : Environment | Nil

    @[JSON::Field(key: "Runtime", converter: AL::Runtime)]
    property runtime : Runtime | Nil

    @[JSON::Field(key: "DeadLetterConfig")]
    property dead_letter_config : DeadLetterConfig | Nil

    @[JSON::Field(key: "KMSKeyArn")]
    property kms_key_arn : String | Nil

    @[JSON::Field(key: "TracingConfig")]
    property tracing_config : TracingConfig | Nil

    @[JSON::Field(key: "RevisionId")]
    property revision_id : String | Nil

    @[JSON::Field(key: "Layers")]
    property layers : Array(String) | Nil

    @[JSON::Field(key: "FileSystemConfigs")]
    property file_system_configs : Array(FileSystemConfig) | Nil

    @[JSON::Field(key: "ImageConfig")]
    property image_config : ImageConfig | Nil

    @[JSON::Field(key: "EphemeralStorage")]
    property ephemeral_storage : EphemeralStorage | Nil

    @[JSON::Field(key: "SnapStart")]
    property snap_start : SnapStart | Nil

    @[JSON::Field(key: "LoggingConfig")]
    property logging_config : LoggingConfig | Nil

    @[JSON::Field(key: "CapacityProviderConfig")]
    property capacity_provider_config : CapacityProviderConfig | Nil

    @[JSON::Field(key: "DurableConfig")]
    property durable_config : DurableConfig | Nil

    def initialize(
      @function_name : String,
      @role : String | Nil = nil,
      @handler : String | Nil = nil,
      @description : String | Nil = nil,
      @timeout : Int32 | Nil = nil,
      @memory_size : Int32 | Nil = nil,
      @vpc_config : VpcConfig | Nil = nil,
      @environment : Environment | Nil = nil,
      @runtime : Runtime | Nil = nil,
      @dead_letter_config : DeadLetterConfig | Nil = nil,
      @kms_key_arn : String | Nil = nil,
      @tracing_config : TracingConfig | Nil = nil,
      @revision_id : String | Nil = nil,
      @layers : Array(String) | Nil = nil,
      @file_system_configs : Array(FileSystemConfig) | Nil = nil,
      @image_config : ImageConfig | Nil = nil,
      @ephemeral_storage : EphemeralStorage | Nil = nil,
      @snap_start : SnapStart | Nil = nil,
      @logging_config : LoggingConfig | Nil = nil,
      @capacity_provider_config : CapacityProviderConfig | Nil = nil,
      @durable_config : DurableConfig | Nil = nil,
    )
    end
  end
end
