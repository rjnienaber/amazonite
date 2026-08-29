private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class UpdateFunctionCodeRequest
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
    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    # The base64-encoded contents of the deployment package. Amazon Web Services SDK and CLI clients
    # handle the encoding for you. Use only with a function defined with a .zip file archive
    # deployment package.
    @[JSON::Field(key: "ZipFile", converter: Core::Base64Converter)]
    property zip_file : Bytes | Nil

    # An Amazon S3 bucket in the same Amazon Web Services Region as your function. The bucket can be
    # in a different Amazon Web Services account. Use only with a function defined with a .zip file
    # archive deployment package.
    @[JSON::Field(key: "S3Bucket")]
    property s3_bucket : String | Nil

    # The Amazon S3 key of the deployment package. Use only with a function defined with a .zip file
    # archive deployment package.
    @[JSON::Field(key: "S3Key")]
    property s3_key : String | Nil

    # For versioned objects, the version of the deployment package object to use.
    @[JSON::Field(key: "S3ObjectVersion")]
    property s3_object_version : String | Nil

    # Specifies how the deployment package is stored. Valid values:
    #
    # - `COPY` (default) – Uploads a copy of your deployment package to Lambda.
    #
    # - `REFERENCE` – Lambda references the deployment package from the specified Amazon S3 bucket.
    @[JSON::Field(key: "S3ObjectStorageMode", converter: AL::S3ObjectStorageMode)]
    property s3_object_storage_mode : S3ObjectStorageMode | Nil

    # URI of a container image in the Amazon ECR registry. Do not use for a function defined with a
    # .zip file archive.
    @[JSON::Field(key: "ImageUri")]
    property image_uri : String | Nil

    # The instruction set architecture that the function supports. Enter a string array with one of
    # the valid values (arm64 or x86_64). The default value is `x86_64`.
    @[JSON::Field(key: "Architectures", converter: Core::ArrayConverter(AL::Architecture))]
    property architectures : Array(Architecture) | Nil

    # Set to true to publish a new version of the function after updating the code. This has the same
    # effect as calling PublishVersion separately.
    @[JSON::Field(key: "Publish")]
    property publish : Bool | Nil

    # Specifies where to publish the function version or configuration.
    @[JSON::Field(key: "PublishTo", converter: AL::FunctionVersionLatestPublished)]
    property publish_to : FunctionVersionLatestPublished | Nil

    # Set to true to validate the request parameters and access permissions without modifying the
    # function code.
    @[JSON::Field(key: "DryRun")]
    property dry_run : Bool | Nil

    # Update the function only if the revision ID matches the ID that's specified. Use this option to
    # avoid modifying a function that has changed since you last read it.
    @[JSON::Field(key: "RevisionId")]
    property revision_id : String | Nil

    # The ARN of the Key Management Service (KMS) customer managed key that's used to encrypt your
    # function's .zip deployment package. If you don't provide a customer managed key, Lambda uses an
    # Amazon Web Services managed key.
    @[JSON::Field(key: "SourceKMSKeyArn")]
    property source_kms_key_arn : String | Nil

    def initialize(
      @function_name : String,
      @zip_file : Bytes | Nil = nil,
      @s3_bucket : String | Nil = nil,
      @s3_key : String | Nil = nil,
      @s3_object_version : String | Nil = nil,
      @s3_object_storage_mode : S3ObjectStorageMode | Nil = nil,
      @image_uri : String | Nil = nil,
      @architectures : Array(Architecture) | Nil = nil,
      @publish : Bool | Nil = nil,
      @publish_to : FunctionVersionLatestPublished | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @revision_id : String | Nil = nil,
      @source_kms_key_arn : String | Nil = nil,
    )
    end
  end
end
