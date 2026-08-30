private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # The code for the Lambda function. You can either specify an object in Amazon S3, upload a .zip
  # file archive deployment package directly, or specify the URI of a container image.
  class FunctionCode
    include JSON::Serializable

    # The base64-encoded contents of the deployment package. Amazon Web Services SDK and CLI clients
    # handle the encoding for you.
    @[JSON::Field(key: "ZipFile", converter: Core::Base64Converter)]
    property zip_file : Bytes | Nil

    # An Amazon S3 bucket in the same Amazon Web Services Region as your function. The bucket can be
    # in a different Amazon Web Services account.
    @[JSON::Field(key: "S3Bucket")]
    property s3_bucket : String | Nil

    # The Amazon S3 key of the deployment package.
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

    # URI of a [container image](https://docs.aws.amazon.com/lambda/latest/dg/lambda-images.html) in
    # the Amazon ECR registry.
    @[JSON::Field(key: "ImageUri")]
    property image_uri : String | Nil

    # The ARN of the Key Management Service (KMS) customer managed key that's used to encrypt your
    # function's .zip deployment package. If you don't provide a customer managed key, Lambda uses an
    # [Amazon Web Services owned
    # key](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-owned-cmk).
    @[JSON::Field(key: "SourceKMSKeyArn")]
    property source_kms_key_arn : String | Nil

    def initialize(
      @zip_file : Bytes | Nil = nil,
      @s3_bucket : String | Nil = nil,
      @s3_key : String | Nil = nil,
      @s3_object_version : String | Nil = nil,
      @s3_object_storage_mode : S3ObjectStorageMode | Nil = nil,
      @image_uri : String | Nil = nil,
      @source_kms_key_arn : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @s3_bucket
        raise Core::ValidationError.new("S3Bucket length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("S3Bucket length must be <= 63") if value.size > 63
        raise Core::ValidationError.new("S3Bucket does not match the required pattern") unless value.matches?(Regex.new("^[0-9A-Za-z\\.\\-_]*(?<!\\.)$"))
      end

      if value = @s3_key
        raise Core::ValidationError.new("S3Key length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("S3Key length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("S3Key does not match the required pattern") unless value.matches?(Regex.new("^.*$"))
      end

      if value = @s3_object_version
        raise Core::ValidationError.new("S3ObjectVersion length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("S3ObjectVersion length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("S3ObjectVersion does not match the required pattern") unless value.matches?(Regex.new("^.*$"))
      end

      if value = @source_kms_key_arn
        raise Core::ValidationError.new("SourceKMSKeyArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("SourceKMSKeyArn length must be <= 10000") if value.size > 10000
        raise Core::ValidationError.new("SourceKMSKeyArn does not match the required pattern") unless value.matches?(Regex.new("^(arn:(aws[a-zA-Z-]*)?:[a-z0-9-.]+:.*)|()$"))
      end
    end

    def_equals_and_hash(@zip_file, @s3_bucket, @s3_key, @s3_object_version, @s3_object_storage_mode, @image_uri, @source_kms_key_arn)
  end
end
