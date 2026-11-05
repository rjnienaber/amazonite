private alias ADDB = Amazonite::DynamoDB
private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  # Contains the Amazon S3 location and format settings for bulk operation input. The `S3Bucket` and
  # `InputFormat` fields are required.
  class InputS3Configuration
    include JSON::Serializable

    # The Amazon Web Services account ID of the input bucket owner. If you omit this value, DynamoDB
    # uses the Amazon Web Services account ID of the requester.
    #
    # `S3BucketOwner` is required when the bucket is owned by another Amazon Web Services account.
    @[JSON::Field(key: "S3BucketOwner")]
    property s3_bucket_owner : String | Nil

    # The name of the Amazon S3 bucket that contains the input objects.
    @[JSON::Field(key: "S3Bucket")]
    property s3_bucket : String

    # An optional key prefix that limits the input to matching objects in the Amazon S3 bucket.
    @[JSON::Field(key: "S3KeyPrefix")]
    property s3_key_prefix : String | Nil

    # The format of the input objects. `DYNAMODB_JSON` uses JSON Lines, with one JSON record per line.
    # `ION` uses a sequence of Ion structs.
    @[JSON::Field(key: "InputFormat", converter: ADDB::BulkOperationInputFormat)]
    property input_format : BulkOperationInputFormat

    # The compression type of the input objects. Valid values are `GZIP`, `ZSTD`, and `NONE`. If you
    # don't specify a value, DynamoDB uses `NONE`.
    @[JSON::Field(key: "InputCompressionType", converter: ADDB::InputCompressionType)]
    property input_compression_type : InputCompressionType | Nil

    def initialize(
      @s3_bucket : String,
      @input_format : BulkOperationInputFormat,
      @s3_bucket_owner : String | Nil = nil,
      @s3_key_prefix : String | Nil = nil,
      @input_compression_type : InputCompressionType | Nil = nil,
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

    def_equals_and_hash(@s3_bucket_owner, @s3_bucket, @s3_key_prefix, @input_format, @input_compression_type)
  end
end
