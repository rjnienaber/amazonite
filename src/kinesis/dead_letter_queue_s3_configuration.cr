private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # The Amazon S3 dead-letter queue configuration for records that cannot be delivered.
  class DeadLetterQueueS3Configuration
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the dead-letter queue Amazon S3 bucket.
    @[JSON::Field(key: "BucketARN")]
    property bucket_arn : String

    # The Amazon Web Services account ID of the expected owner of the dead-letter queue bucket.
    @[JSON::Field(key: "ExpectedBucketOwner")]
    property expected_bucket_owner : String

    # The Amazon S3 key prefix for error records.
    @[JSON::Field(key: "ErrorOutputPrefix")]
    property error_output_prefix : String | Nil

    def initialize(
      @bucket_arn : String,
      @expected_bucket_owner : String,
      @error_output_prefix : String | Nil = nil,
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

      if value = @error_output_prefix
        raise Core::ValidationError.new("ErrorOutputPrefix length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ErrorOutputPrefix length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("ErrorOutputPrefix does not match the required pattern") unless value.matches?(Regex.new("^[0-9A-Za-z!\\-_'.*()\\/]+$"))
      end
    end

    def_equals_and_hash(@bucket_arn, @expected_bucket_owner, @error_output_prefix)
  end
end
