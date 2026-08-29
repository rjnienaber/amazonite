private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class CreateFunctionRequest
    include JSON::Serializable

    @[JSON::Field(key: "FunctionName")]
    property function_name : String

    @[JSON::Field(key: "Runtime", converter: AL::Runtime)]
    property runtime : Runtime | Nil

    @[JSON::Field(key: "Role")]
    property role : String

    @[JSON::Field(key: "Handler")]
    property handler : String | Nil

    @[JSON::Field(key: "Code")]
    property code : FunctionCode

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "Timeout")]
    property timeout : Int32 | Nil

    @[JSON::Field(key: "MemorySize")]
    property memory_size : Int32 | Nil

    @[JSON::Field(key: "Publish")]
    property publish : Bool | Nil

    @[JSON::Field(key: "PublishTo", converter: AL::FunctionVersionLatestPublished)]
    property publish_to : FunctionVersionLatestPublished | Nil

    @[JSON::Field(key: "VpcConfig")]
    property vpc_config : VpcConfig | Nil

    @[JSON::Field(key: "PackageType", converter: AL::PackageType)]
    property package_type : PackageType | Nil

    @[JSON::Field(key: "DeadLetterConfig")]
    property dead_letter_config : DeadLetterConfig | Nil

    @[JSON::Field(key: "Environment")]
    property environment : Environment | Nil

    @[JSON::Field(key: "KMSKeyArn")]
    property kms_key_arn : String | Nil

    @[JSON::Field(key: "TracingConfig")]
    property tracing_config : TracingConfig | Nil

    @[JSON::Field(key: "Tags")]
    property tags : Hash(String, String) | Nil

    @[JSON::Field(key: "Layers")]
    property layers : Array(String) | Nil

    @[JSON::Field(key: "FileSystemConfigs")]
    property file_system_configs : Array(FileSystemConfig) | Nil

    @[JSON::Field(key: "CodeSigningConfigArn")]
    property code_signing_config_arn : String | Nil

    @[JSON::Field(key: "ImageConfig")]
    property image_config : ImageConfig | Nil

    @[JSON::Field(key: "Architectures", converter: Core::ArrayConverter(AL::Architecture))]
    property architectures : Array(Architecture) | Nil

    @[JSON::Field(key: "EphemeralStorage")]
    property ephemeral_storage : EphemeralStorage | Nil

    @[JSON::Field(key: "SnapStart")]
    property snap_start : SnapStart | Nil

    @[JSON::Field(key: "LoggingConfig")]
    property logging_config : LoggingConfig | Nil

    @[JSON::Field(key: "TenancyConfig")]
    property tenancy_config : TenancyConfig | Nil

    @[JSON::Field(key: "CapacityProviderConfig")]
    property capacity_provider_config : CapacityProviderConfig | Nil

    @[JSON::Field(key: "DurableConfig")]
    property durable_config : DurableConfig | Nil

    def initialize(
      @function_name : String,
      @role : String,
      @code : FunctionCode,
      @runtime : Runtime | Nil = nil,
      @handler : String | Nil = nil,
      @description : String | Nil = nil,
      @timeout : Int32 | Nil = nil,
      @memory_size : Int32 | Nil = nil,
      @publish : Bool | Nil = nil,
      @publish_to : FunctionVersionLatestPublished | Nil = nil,
      @vpc_config : VpcConfig | Nil = nil,
      @package_type : PackageType | Nil = nil,
      @dead_letter_config : DeadLetterConfig | Nil = nil,
      @environment : Environment | Nil = nil,
      @kms_key_arn : String | Nil = nil,
      @tracing_config : TracingConfig | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
      @layers : Array(String) | Nil = nil,
      @file_system_configs : Array(FileSystemConfig) | Nil = nil,
      @code_signing_config_arn : String | Nil = nil,
      @image_config : ImageConfig | Nil = nil,
      @architectures : Array(Architecture) | Nil = nil,
      @ephemeral_storage : EphemeralStorage | Nil = nil,
      @snap_start : SnapStart | Nil = nil,
      @logging_config : LoggingConfig | Nil = nil,
      @tenancy_config : TenancyConfig | Nil = nil,
      @capacity_provider_config : CapacityProviderConfig | Nil = nil,
      @durable_config : DurableConfig | Nil = nil,
    )
    end
  end
end
