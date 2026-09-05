private alias AK = Amazonite::Kinesis
private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # The Amazon S3 storage settings for a general purpose Amazon S3 destination.
  class S3StorageConfiguration
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the destination Amazon S3 bucket.
    @[JSON::Field(key: "BucketARN")]
    property bucket_arn : String

    # The Amazon Web Services account ID of the expected owner of the destination bucket. This value
    # helps prevent delivery to an unintended bucket if ownership changes.
    @[JSON::Field(key: "ExpectedBucketOwner")]
    property expected_bucket_owner : String

    # The template used to construct the Amazon S3 object key for delivered objects. If not specified,
    # a default template is used.
    @[JSON::Field(key: "OutputKeyTemplate")]
    property output_key_template : String | Nil

    # The Amazon S3 storage class for delivered objects. Valid values:
    #
    # - `STANDARD` - Default storage class for frequently accessed data. (default)
    #
    # - `INTELLIGENT_TIERING` - Automatically moves objects to the most cost-effective access tier
    # based on usage patterns.
    #
    # - `GLACIER_IR` - Low-cost storage for rarely accessed data that requires millisecond retrieval.
    @[JSON::Field(key: "StorageClass", converter: AK::S3StorageClass)]
    property storage_class : S3StorageClass | Nil

    # The compression applied to delivered objects. Valid values:
    #
    # - `NONE` - No compression.
    #
    # - `GZIP` - gzip compression.
    #
    # - `ZSTD` - Zstandard compression.
    @[JSON::Field(key: "CompressionType", converter: AK::S3CompressionType)]
    property compression_type : S3CompressionType

    def initialize(
      @bucket_arn : String,
      @expected_bucket_owner : String,
      @compression_type : S3CompressionType,
      @output_key_template : String | Nil = nil,
      @storage_class : S3StorageClass | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @bucket_arn
        raise Core::ValidationError.new("BucketARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("BucketARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("BucketARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[-a-z0-9]*:s3:::[a-z0-9._-]{3,63}$"))
      end

      if value = @expected_bucket_owner
        raise Core::ValidationError.new("ExpectedBucketOwner length must be >= 12") if value.size < 12
        raise Core::ValidationError.new("ExpectedBucketOwner length must be <= 12") if value.size > 12
        raise Core::ValidationError.new("ExpectedBucketOwner does not match the required pattern") unless value.matches?(Regex.new("^\\d{12}$"))
      end

      if value = @output_key_template
        raise Core::ValidationError.new("OutputKeyTemplate length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("OutputKeyTemplate length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("OutputKeyTemplate does not match the required pattern") unless value.matches?(Regex.new("^[0-9A-Za-z!\\-_'.*()\\/=:{}]+$"))
      end
    end

    def_equals_and_hash(@bucket_arn, @expected_bucket_owner, @output_key_template, @storage_class, @compression_type)
  end
end
