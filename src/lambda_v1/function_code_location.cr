private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # Details about a function's deployment package.
  class FunctionCodeLocation
    include JSON::Serializable

    # The service that's hosting the file.
    @[JSON::Field(key: "RepositoryType")]
    property repository_type : String | Nil

    # A presigned URL that you can use to download the deployment package.
    @[JSON::Field(key: "Location")]
    property location : String | Nil

    # URI of a container image in the Amazon ECR registry.
    @[JSON::Field(key: "ImageUri")]
    property image_uri : String | Nil

    # The resolved URI for the image.
    @[JSON::Field(key: "ResolvedImageUri")]
    property resolved_image_uri : String | Nil

    # The resolved Amazon S3 object that contains the deployment package.
    @[JSON::Field(key: "ResolvedS3Object")]
    property resolved_s3_object : ResolvedS3Object | Nil

    # The ARN of the Key Management Service (KMS) customer managed key that's used to encrypt your
    # function's .zip deployment package. If you don't provide a customer managed key, Lambda uses an
    # [Amazon Web Services owned
    # key](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-owned-cmk).
    @[JSON::Field(key: "SourceKMSKeyArn")]
    property source_kms_key_arn : String | Nil

    # An object that contains details about an error related to function deployment package retrieval.
    @[JSON::Field(key: "Error")]
    property error : FunctionCodeLocationError | Nil

    def initialize(
      @repository_type : String | Nil = nil,
      @location : String | Nil = nil,
      @image_uri : String | Nil = nil,
      @resolved_image_uri : String | Nil = nil,
      @resolved_s3_object : ResolvedS3Object | Nil = nil,
      @source_kms_key_arn : String | Nil = nil,
      @error : FunctionCodeLocationError | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @location
        raise Core::ValidationError.new("Location length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Location length must be <= 10000") if value.size > 10000
      end

      if value = @resolved_s3_object
        value.validate!
      end

      if value = @source_kms_key_arn
        raise Core::ValidationError.new("SourceKMSKeyArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("SourceKMSKeyArn length must be <= 10000") if value.size > 10000
        raise Core::ValidationError.new("SourceKMSKeyArn does not match the required pattern") unless value.matches?(Regex.new("^(arn:(aws[a-zA-Z-]*)?:[a-z0-9-.]+:.*)|()$"))
      end

      if value = @error
        value.validate!
      end
    end

    def_equals_and_hash(@repository_type, @location, @image_uri, @resolved_image_uri, @resolved_s3_object, @source_kms_key_arn, @error)
  end
end
