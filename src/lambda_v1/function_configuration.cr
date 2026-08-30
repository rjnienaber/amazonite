private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # Details about a function's configuration.
  class FunctionConfiguration
    include JSON::Serializable

    # The name of the function.
    @[JSON::Field(key: "FunctionName")]
    property function_name : String | Nil

    # The function's Amazon Resource Name (ARN).
    @[JSON::Field(key: "FunctionArn")]
    property function_arn : String | Nil

    # The identifier of the function's [
    # runtime](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html). Runtime is required
    # if the deployment package is a .zip file archive. Specifying a runtime results in an error if
    # you're deploying a function using a container image.
    #
    # The following list includes deprecated runtimes. Lambda blocks creating new functions and
    # updating existing functions shortly after each runtime is deprecated. For more information, see
    # [Runtime use after
    # deprecation](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html#runtime-deprecation-levels).
    #
    # For a list of all currently supported runtimes, see [Supported
    # runtimes](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html#runtimes-supported).
    @[JSON::Field(key: "Runtime", converter: AL::Runtime)]
    property runtime : Runtime | Nil

    # The function's execution role.
    @[JSON::Field(key: "Role")]
    property role : String | Nil

    # The function that Lambda calls to begin running your function.
    @[JSON::Field(key: "Handler")]
    property handler : String | Nil

    # The size of the function's deployment package, in bytes.
    @[JSON::Field(key: "CodeSize")]
    property code_size : Int64 | Nil

    # The function's description.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The amount of time in seconds that Lambda allows a function to run before stopping it.
    @[JSON::Field(key: "Timeout")]
    property timeout : Int32 | Nil

    # The amount of memory available to the function at runtime.
    @[JSON::Field(key: "MemorySize")]
    property memory_size : Int32 | Nil

    # The date and time that the function was last updated, in [ISO-8601
    # format](https://www.w3.org/TR/NOTE-datetime) (YYYY-MM-DDThh:mm:ss.sTZD).
    @[JSON::Field(key: "LastModified")]
    property last_modified : String | Nil

    # The SHA256 hash of the function's deployment package.
    @[JSON::Field(key: "CodeSha256")]
    property code_sha_256 : String | Nil

    # The version of the Lambda function.
    @[JSON::Field(key: "Version")]
    property version : String | Nil

    # The function's networking configuration.
    @[JSON::Field(key: "VpcConfig")]
    property vpc_config : VpcConfigResponse | Nil

    # The function's dead letter queue.
    @[JSON::Field(key: "DeadLetterConfig")]
    property dead_letter_config : DeadLetterConfig | Nil

    # The function's [environment
    # variables](https://docs.aws.amazon.com/lambda/latest/dg/configuration-envvars.html). Omitted
    # from CloudTrail logs.
    @[JSON::Field(key: "Environment")]
    property environment : EnvironmentResponse | Nil

    # The ARN of the Key Management Service (KMS) customer managed key that's used to encrypt the
    # following resources:
    #
    # - The function's [environment
    # variables](https://docs.aws.amazon.com/lambda/latest/dg/configuration-envvars.html#configuration-envvars-encryption).
    #
    # - The function's [Lambda
    # SnapStart](https://docs.aws.amazon.com/lambda/latest/dg/snapstart-security.html) snapshots.
    #
    # - When used with `SourceKMSKeyArn`, the unzipped version of the .zip deployment package that's
    # used for function invocations. For more information, see [ Specifying a customer managed key for
    # Lambda](https://docs.aws.amazon.com/lambda/latest/dg/encrypt-zip-package.html#enable-zip-custom-encryption).
    #
    # - The optimized version of the container image that's used for function invocations. Note that
    # this is not the same key that's used to protect your container image in the Amazon Elastic
    # Container Registry (Amazon ECR). For more information, see [Function
    # lifecycle](https://docs.aws.amazon.com/lambda/latest/dg/images-create.html#images-lifecycle).
    #
    # If you don't provide a customer managed key, Lambda uses an [Amazon Web Services owned
    # key](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-owned-cmk) or an
    # [Amazon Web Services managed
    # key](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk).
    @[JSON::Field(key: "KMSKeyArn")]
    property kms_key_arn : String | Nil

    # The function's X-Ray tracing configuration.
    @[JSON::Field(key: "TracingConfig")]
    property tracing_config : TracingConfigResponse | Nil

    # For Lambda@Edge functions, the ARN of the main function.
    @[JSON::Field(key: "MasterArn")]
    property master_arn : String | Nil

    # The latest updated revision of the function or alias.
    @[JSON::Field(key: "RevisionId")]
    property revision_id : String | Nil

    # The function's [layers](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html).
    @[JSON::Field(key: "Layers")]
    property layers : Array(Layer) | Nil

    # The current state of the function. When the state is `Inactive`, you can reactivate the function
    # by invoking it.
    @[JSON::Field(key: "State", converter: AL::State)]
    property state : State | Nil

    # The reason for the function's current state.
    @[JSON::Field(key: "StateReason")]
    property state_reason : String | Nil

    # The reason code for the function's current state. When the code is `Creating`, you can't invoke
    # or modify the function.
    @[JSON::Field(key: "StateReasonCode", converter: AL::StateReasonCode)]
    property state_reason_code : StateReasonCode | Nil

    # The status of the last update that was performed on the function. This is first set to
    # `Successful` after function creation completes.
    @[JSON::Field(key: "LastUpdateStatus", converter: AL::LastUpdateStatus)]
    property last_update_status : LastUpdateStatus | Nil

    # The reason for the last update that was performed on the function.
    @[JSON::Field(key: "LastUpdateStatusReason")]
    property last_update_status_reason : String | Nil

    # The reason code for the last update that was performed on the function.
    @[JSON::Field(key: "LastUpdateStatusReasonCode", converter: AL::LastUpdateStatusReasonCode)]
    property last_update_status_reason_code : LastUpdateStatusReasonCode | Nil

    # Connection settings for an [Amazon EFS file
    # system](https://docs.aws.amazon.com/lambda/latest/dg/configuration-filesystem.html) or an
    # [Amazon S3 Files file
    # system](https://docs.aws.amazon.com/lambda/latest/dg/configuration-filesystem.html).
    @[JSON::Field(key: "FileSystemConfigs")]
    property file_system_configs : Array(FileSystemConfig) | Nil

    # The ARN of the signing profile version.
    @[JSON::Field(key: "SigningProfileVersionArn")]
    property signing_profile_version_arn : String | Nil

    # The ARN of the signing job.
    @[JSON::Field(key: "SigningJobArn")]
    property signing_job_arn : String | Nil

    # The type of deployment package. Set to `Image` for container image and set `Zip` for .zip file
    # archive.
    @[JSON::Field(key: "PackageType", converter: AL::PackageType)]
    property package_type : PackageType | Nil

    # The function's image configuration values.
    @[JSON::Field(key: "ImageConfigResponse")]
    property image_config_response : ImageConfigResponse | Nil

    # The instruction set architecture that the function supports. Architecture is a string array with
    # one of the valid values. The default architecture value is `x86_64`.
    @[JSON::Field(key: "Architectures", converter: Core::ArrayConverter(AL::Architecture))]
    property architectures : Array(Architecture) | Nil

    # The size of the function's `/tmp` directory in MB. The default value is 512, but can be any
    # whole number between 512 and 10,240 MB. For more information, see [Configuring ephemeral storage
    # (console)](https://docs.aws.amazon.com/lambda/latest/dg/configuration-function-common.html#configuration-ephemeral-storage).
    @[JSON::Field(key: "EphemeralStorage")]
    property ephemeral_storage : EphemeralStorage | Nil

    # Set `ApplyOn` to `PublishedVersions` to create a snapshot of the initialized execution
    # environment when you publish a function version. For more information, see [Improving startup
    # performance with Lambda SnapStart](https://docs.aws.amazon.com/lambda/latest/dg/snapstart.html).
    @[JSON::Field(key: "SnapStart")]
    property snap_start : SnapStartResponse | Nil

    # The ARN of the runtime and any errors that occured.
    @[JSON::Field(key: "RuntimeVersionConfig")]
    property runtime_version_config : RuntimeVersionConfig | Nil

    # The function's Amazon CloudWatch Logs configuration settings.
    @[JSON::Field(key: "LoggingConfig")]
    property logging_config : LoggingConfig | Nil

    # The function's tenant isolation configuration settings. Determines whether the Lambda function
    # runs on a shared or dedicated infrastructure per unique tenant.
    @[JSON::Field(key: "TenancyConfig")]
    property tenancy_config : TenancyConfig | Nil

    # Configuration for the capacity provider that manages compute resources for Lambda functions.
    @[JSON::Field(key: "CapacityProviderConfig")]
    property capacity_provider_config : CapacityProviderConfig | Nil

    # The SHA256 hash of the function configuration.
    @[JSON::Field(key: "ConfigSha256")]
    property config_sha_256 : String | Nil

    # The function's durable execution configuration settings, if the function is configured for
    # durability.
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

    def_equals_and_hash(@function_name, @function_arn, @runtime, @role, @handler, @code_size, @description, @timeout, @memory_size, @last_modified, @code_sha_256, @version, @vpc_config, @dead_letter_config, @environment, @kms_key_arn, @tracing_config, @master_arn, @revision_id, @layers, @state, @state_reason, @state_reason_code, @last_update_status, @last_update_status_reason, @last_update_status_reason_code, @file_system_configs, @signing_profile_version_arn, @signing_job_arn, @package_type, @image_config_response, @architectures, @ephemeral_storage, @snap_start, @runtime_version_config, @logging_config, @tenancy_config, @capacity_provider_config, @config_sha_256, @durable_config)
  end
end
