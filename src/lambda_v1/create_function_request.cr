private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class CreateFunctionRequest
    include JSON::Serializable

    # The name or ARN of the Lambda function.
    #
    # **Name formats**
    #
    # - **Function name** – `my-function`.
    #
    # - **Function ARN** – `arn:aws:lambda:us-west-2:123456789012:function:my-function`.
    #
    # - **Partial ARN** – `123456789012:function:my-function`.
    #
    # The length constraint applies only to the full ARN. If you specify only the function name, it is
    # limited to 64 characters in length.
    @[JSON::Field(key: "FunctionName")]
    property function_name : String

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

    # The Amazon Resource Name (ARN) of the function's execution role.
    @[JSON::Field(key: "Role")]
    property role : String

    # The name of the method within your code that Lambda calls to run your function. Handler is
    # required if the deployment package is a .zip file archive. The format includes the file name. It
    # can also include namespaces and other qualifiers, depending on the runtime. For more
    # information, see [Lambda programming
    # model](https://docs.aws.amazon.com/lambda/latest/dg/foundation-progmodel.html).
    @[JSON::Field(key: "Handler")]
    property handler : String | Nil

    # The code for the function.
    @[JSON::Field(key: "Code")]
    property code : FunctionCode

    # A description of the function.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The amount of time (in seconds) that Lambda allows a function to run before stopping it. The
    # default is 3 seconds. The maximum allowed value is 900 seconds. For more information, see
    # [Lambda execution
    # environment](https://docs.aws.amazon.com/lambda/latest/dg/runtimes-context.html).
    @[JSON::Field(key: "Timeout")]
    property timeout : Int32 | Nil

    # The amount of [memory available to the
    # function](https://docs.aws.amazon.com/lambda/latest/dg/configuration-function-common.html#configuration-memory-console)
    # at runtime. Increasing the function memory also increases its CPU allocation. The default value
    # is 128 MB. The value can be any multiple of 1 MB.
    @[JSON::Field(key: "MemorySize")]
    property memory_size : Int32 | Nil

    # Set to true to publish the first version of the function during creation.
    @[JSON::Field(key: "Publish")]
    property publish : Bool | Nil

    # Specifies where to publish the function version or configuration.
    @[JSON::Field(key: "PublishTo", converter: AL::FunctionVersionLatestPublished)]
    property publish_to : FunctionVersionLatestPublished | Nil

    # For network connectivity to Amazon Web Services resources in a VPC, specify a list of security
    # groups and subnets in the VPC. When you connect a function to a VPC, it can access resources and
    # the internet only through that VPC. For more information, see [Configuring a Lambda function to
    # access resources in a VPC](https://docs.aws.amazon.com/lambda/latest/dg/configuration-vpc.html).
    @[JSON::Field(key: "VpcConfig")]
    property vpc_config : VpcConfig | Nil

    # The type of deployment package. Set to `Image` for container image and set to `Zip` for .zip
    # file archive.
    @[JSON::Field(key: "PackageType", converter: AL::PackageType)]
    property package_type : PackageType | Nil

    # A dead-letter queue configuration that specifies the queue or topic where Lambda sends
    # asynchronous events when they fail processing. For more information, see [Dead-letter
    # queues](https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#invocation-dlq).
    @[JSON::Field(key: "DeadLetterConfig")]
    property dead_letter_config : DeadLetterConfig | Nil

    # Environment variables that are accessible from function code during execution.
    @[JSON::Field(key: "Environment")]
    property environment : Environment | Nil

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

    # Set `Mode` to `Active` to sample and trace a subset of incoming requests with
    # [X-Ray](https://docs.aws.amazon.com/lambda/latest/dg/services-xray.html).
    @[JSON::Field(key: "TracingConfig")]
    property tracing_config : TracingConfig | Nil

    # A list of [tags](https://docs.aws.amazon.com/lambda/latest/dg/tagging.html) to apply to the
    # function.
    @[JSON::Field(key: "Tags")]
    property tags : Hash(String, String) | Nil

    # A list of [function
    # layers](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html) to add to the
    # function's execution environment. Specify each layer by its ARN, including the version.
    @[JSON::Field(key: "Layers")]
    property layers : Array(String) | Nil

    # Connection settings for an Amazon EFS file system or an Amazon S3 Files file system.
    @[JSON::Field(key: "FileSystemConfigs")]
    property file_system_configs : Array(FileSystemConfig) | Nil

    # To enable code signing for this function, specify the ARN of a code-signing configuration. A
    # code-signing configuration includes a set of signing profiles, which define the trusted
    # publishers for this function.
    @[JSON::Field(key: "CodeSigningConfigArn")]
    property code_signing_config_arn : String | Nil

    # Container image [configuration
    # values](https://docs.aws.amazon.com/lambda/latest/dg/images-create.html#images-parms) that
    # override the values in the container image Dockerfile.
    @[JSON::Field(key: "ImageConfig")]
    property image_config : ImageConfig | Nil

    # The instruction set architecture that the function supports. Enter a string array with one of
    # the valid values (arm64 or x86_64). The default value is `x86_64`.
    @[JSON::Field(key: "Architectures", converter: Core::ArrayConverter(AL::Architecture))]
    property architectures : Array(Architecture) | Nil

    # The size of the function's `/tmp` directory in MB. The default value is 512, but can be any
    # whole number between 512 and 10,240 MB. For more information, see [Configuring ephemeral storage
    # (console)](https://docs.aws.amazon.com/lambda/latest/dg/configuration-function-common.html#configuration-ephemeral-storage).
    @[JSON::Field(key: "EphemeralStorage")]
    property ephemeral_storage : EphemeralStorage | Nil

    # The function's [SnapStart](https://docs.aws.amazon.com/lambda/latest/dg/snapstart.html) setting.
    @[JSON::Field(key: "SnapStart")]
    property snap_start : SnapStart | Nil

    # The function's Amazon CloudWatch Logs configuration settings.
    @[JSON::Field(key: "LoggingConfig")]
    property logging_config : LoggingConfig | Nil

    # Configuration for multi-tenant applications that use Lambda functions. Defines tenant isolation
    # settings and resource allocations. Required for functions supporting multiple tenants.
    @[JSON::Field(key: "TenancyConfig")]
    property tenancy_config : TenancyConfig | Nil

    # Configuration for the capacity provider that manages compute resources for Lambda functions.
    @[JSON::Field(key: "CapacityProviderConfig")]
    property capacity_provider_config : CapacityProviderConfig | Nil

    # Configuration settings for durable functions. Enables creating functions with durability that
    # can remember their state and continue execution even after interruptions.
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

    def_equals_and_hash(@function_name, @runtime, @role, @handler, @code, @description, @timeout, @memory_size, @publish, @publish_to, @vpc_config, @package_type, @dead_letter_config, @environment, @kms_key_arn, @tracing_config, @tags, @layers, @file_system_configs, @code_signing_config_arn, @image_config, @architectures, @ephemeral_storage, @snap_start, @logging_config, @tenancy_config, @capacity_provider_config, @durable_config)
  end
end
