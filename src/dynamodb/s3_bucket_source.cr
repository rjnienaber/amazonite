private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  # The S3 bucket that is being imported from.
  class S3BucketSource
    include JSON::Serializable

    # The account number of the S3 bucket that is being imported from. If the bucket is owned by the
    # requester this is optional.
    @[JSON::Field(key: "S3BucketOwner")]
    property s3_bucket_owner : String | Nil

    # The S3 bucket that is being imported from.
    @[JSON::Field(key: "S3Bucket")]
    property s3_bucket : String

    # The key prefix shared by all S3 Objects that are being imported.
    @[JSON::Field(key: "S3KeyPrefix")]
    property s3_key_prefix : String | Nil

    def initialize(
      @s3_bucket : String,
      @s3_bucket_owner : String | Nil = nil,
      @s3_key_prefix : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @s3_bucket_owner
        raise Core::ValidationError.new("S3BucketOwner does not match the required pattern") unless value.matches?(Regex.new("^[0-9]{12}$"))
      end

      if value = @s3_bucket
        raise Core::ValidationError.new("S3Bucket length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("S3Bucket length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("S3Bucket does not match the required pattern") unless value.matches?(Regex.new("^[a-z0-9A-Z]+[\\.\\-\\w]*[a-z0-9A-Z]+$"))
      end

      if value = @s3_key_prefix
        raise Core::ValidationError.new("S3KeyPrefix length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("S3KeyPrefix length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@s3_bucket_owner, @s3_bucket, @s3_key_prefix)
  end
end
