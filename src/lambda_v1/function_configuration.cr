private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class FunctionConfiguration
    include JSON::Serializable

    @[JSON::Field(key: "FunctionName")]
    property function_name : String | Nil

    @[JSON::Field(key: "FunctionArn")]
    property function_arn : String | Nil

    @[JSON::Field(key: "Runtime", converter: AL::Runtime)]
    property runtime : Runtime | Nil

    @[JSON::Field(key: "Role")]
    property role : String | Nil

    @[JSON::Field(key: "Handler")]
    property handler : String | Nil

    @[JSON::Field(key: "CodeSize")]
    property code_size : Int64 | Nil

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "Timeout")]
    property timeout : Int32 | Nil

    @[JSON::Field(key: "MemorySize")]
    property memory_size : Int32 | Nil

    @[JSON::Field(key: "LastModified")]
    property last_modified : String | Nil

    @[JSON::Field(key: "CodeSha256")]
    property code_sha_256 : String | Nil

    @[JSON::Field(key: "Version")]
    property version : String | Nil

    @[JSON::Field(key: "VpcConfig")]
    property vpc_config : VpcConfigResponse | Nil

    @[JSON::Field(key: "DeadLetterConfig")]
    property dead_letter_config : DeadLetterConfig | Nil

    @[JSON::Field(key: "Environment")]
    property environment : EnvironmentResponse | Nil

    @[JSON::Field(key: "KMSKeyArn")]
    property kms_key_arn : String | Nil

    @[JSON::Field(key: "TracingConfig")]
    property tracing_config : TracingConfigResponse | Nil

    @[JSON::Field(key: "MasterArn")]
    property master_arn : String | Nil

    @[JSON::Field(key: "RevisionId")]
    property revision_id : String | Nil

    @[JSON::Field(key: "Layers")]
    property layers : Array(Layer) | Nil

    @[JSON::Field(key: "State", converter: AL::State)]
    property state : State | Nil

    @[JSON::Field(key: "StateReason")]
    property state_reason : String | Nil

    @[JSON::Field(key: "StateReasonCode", converter: AL::StateReasonCode)]
    property state_reason_code : StateReasonCode | Nil

    @[JSON::Field(key: "LastUpdateStatus", converter: AL::LastUpdateStatus)]
    property last_update_status : LastUpdateStatus | Nil

    @[JSON::Field(key: "LastUpdateStatusReason")]
    property last_update_status_reason : String | Nil

    @[JSON::Field(key: "LastUpdateStatusReasonCode", converter: AL::LastUpdateStatusReasonCode)]
    property last_update_status_reason_code : LastUpdateStatusReasonCode | Nil

    @[JSON::Field(key: "FileSystemConfigs")]
    property file_system_configs : Array(FileSystemConfig) | Nil

    @[JSON::Field(key: "SigningProfileVersionArn")]
    property signing_profile_version_arn : String | Nil

    @[JSON::Field(key: "SigningJobArn")]
    property signing_job_arn : String | Nil

    @[JSON::Field(key: "PackageType", converter: AL::PackageType)]
    property package_type : PackageType | Nil

    @[JSON::Field(key: "ImageConfigResponse")]
    property image_config_response : ImageConfigResponse | Nil

    @[JSON::Field(key: "Architectures", converter: Core::ArrayConverter(AL::Architecture))]
    property architectures : Array(Architecture) | Nil

    @[JSON::Field(key: "EphemeralStorage")]
    property ephemeral_storage : EphemeralStorage | Nil

    @[JSON::Field(key: "SnapStart")]
    property snap_start : SnapStartResponse | Nil

    @[JSON::Field(key: "RuntimeVersionConfig")]
    property runtime_version_config : RuntimeVersionConfig | Nil

    @[JSON::Field(key: "LoggingConfig")]
    property logging_config : LoggingConfig | Nil

    @[JSON::Field(key: "TenancyConfig")]
    property tenancy_config : TenancyConfig | Nil

    @[JSON::Field(key: "CapacityProviderConfig")]
    property capacity_provider_config : CapacityProviderConfig | Nil

    @[JSON::Field(key: "ConfigSha256")]
    property config_sha_256 : String | Nil

    @[JSON::Field(key: "DurableConfig")]
    property durable_config : DurableConfig | Nil

    def initialize(
      @function_name : String | Nil = nil,
      @function_arn : String | Nil = nil,
      @runtime : Runtime | Nil = nil,
      @role : String | Nil = nil,
      @handler : String | Nil = nil,
      @code_size : Int64 | Nil = nil,
      @description : String | Nil = nil,
      @timeout : Int32 | Nil = nil,
      @memory_size : Int32 | Nil = nil,
      @last_modified : String | Nil = nil,
      @code_sha_256 : String | Nil = nil,
      @version : String | Nil = nil,
      @vpc_config : VpcConfigResponse | Nil = nil,
      @dead_letter_config : DeadLetterConfig | Nil = nil,
      @environment : EnvironmentResponse | Nil = nil,
      @kms_key_arn : String | Nil = nil,
      @tracing_config : TracingConfigResponse | Nil = nil,
      @master_arn : String | Nil = nil,
      @revision_id : String | Nil = nil,
      @layers : Array(Layer) | Nil = nil,
      @state : State | Nil = nil,
      @state_reason : String | Nil = nil,
      @state_reason_code : StateReasonCode | Nil = nil,
      @last_update_status : LastUpdateStatus | Nil = nil,
      @last_update_status_reason : String | Nil = nil,
      @last_update_status_reason_code : LastUpdateStatusReasonCode | Nil = nil,
      @file_system_configs : Array(FileSystemConfig) | Nil = nil,
      @signing_profile_version_arn : String | Nil = nil,
      @signing_job_arn : String | Nil = nil,
      @package_type : PackageType | Nil = nil,
      @image_config_response : ImageConfigResponse | Nil = nil,
      @architectures : Array(Architecture) | Nil = nil,
      @ephemeral_storage : EphemeralStorage | Nil = nil,
      @snap_start : SnapStartResponse | Nil = nil,
      @runtime_version_config : RuntimeVersionConfig | Nil = nil,
      @logging_config : LoggingConfig | Nil = nil,
      @tenancy_config : TenancyConfig | Nil = nil,
      @capacity_provider_config : CapacityProviderConfig | Nil = nil,
      @config_sha_256 : String | Nil = nil,
      @durable_config : DurableConfig | Nil = nil,
    )
    end
  end
end
