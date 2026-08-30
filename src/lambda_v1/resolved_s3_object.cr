private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # Details about the resolved Amazon S3 object that contains a function's deployment package.
  class ResolvedS3Object
    include JSON::Serializable

    # The Amazon S3 bucket that contains the deployment package.
    @[JSON::Field(key: "S3Bucket")]
    property s3_bucket : String | Nil

    # The Amazon S3 key of the deployment package.
    @[JSON::Field(key: "S3Key")]
    property s3_key : String | Nil

    # The version of the deployment package object.
    @[JSON::Field(key: "S3ObjectVersion")]
    property s3_object_version : String | Nil

    def initialize(
      @s3_bucket : String | Nil = nil,
      @s3_key : String | Nil = nil,
      @s3_object_version : String | Nil = nil,
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
    end

    def_equals_and_hash(@s3_bucket, @s3_key, @s3_object_version)
  end
end
