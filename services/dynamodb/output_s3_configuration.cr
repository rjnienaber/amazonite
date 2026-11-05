private alias ADDB = Amazonite::DynamoDB
private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  # Contains the Amazon S3 location, encryption settings, and output types for a bulk operation. The
  # `S3Bucket` and `OutputType` fields are required.
  class OutputS3Configuration
    include JSON::Serializable

    # The Amazon Web Services account ID of the output bucket owner. If you omit this value, DynamoDB
    # uses the Amazon Web Services account ID of the requester.
    #
    # `S3BucketOwner` is required when the bucket is owned by another Amazon Web Services account.
    @[JSON::Field(key: "S3BucketOwner")]
    property s3_bucket_owner : String | Nil

    # The name of the Amazon S3 bucket where DynamoDB writes output records.
    @[JSON::Field(key: "S3Bucket")]
    property s3_bucket : String | Nil

    # An optional key prefix under which DynamoDB writes the output records.
    @[JSON::Field(key: "S3KeyPrefix")]
    property s3_key_prefix : String | Nil

    # The server-side encryption algorithm for the output objects. Valid values are `AES256` and
    # `KMS`. If you don't specify a value, Amazon S3 applies the destination bucket's default
    # encryption settings.
    @[JSON::Field(key: "S3SseAlgorithm", converter: ADDB::S3SseAlgorithm)]
    property s3_sse_algorithm : S3SseAlgorithm | Nil

    # The identifier of the KMS key that encrypts the output objects. Specify this value when
    # `S3SseAlgorithm` is `KMS`. Don't specify it when the algorithm is `AES256`.
    @[JSON::Field(key: "S3SseKmsKeyId")]
    property s3_sse_kms_key_id : String | Nil

    # The following values describe the types of output that DynamoDB writes for individual input
    # items. Include one or both values.
    #
    # ERROR Reports input records or input objects that DynamoDB couldn't process. This includes
    # malformed input and item validation failures, such as a missing or incorrectly typed primary key
    # attribute or an item that exceeds a DynamoDB limit.
    #
    # CONDITION_CHECK_FAILURE Reports the attempted item and, when present, the existing item for a
    # write whose condition expression evaluates to false.
    @[JSON::Field(key: "OutputType", converter: Core::ArrayConverter(ADDB::OutputTypeEnum))]
    property output_type : Array(OutputTypeEnum) = [] of OutputTypeEnum

    def initialize(
      @output_type : Array(OutputTypeEnum),
      @s3_bucket_owner : String | Nil = nil,
      @s3_bucket : String | Nil = nil,
      @s3_key_prefix : String | Nil = nil,
      @s3_sse_algorithm : S3SseAlgorithm | Nil = nil,
      @s3_sse_kms_key_id : String | Nil = nil,
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

      if value = @s3_sse_kms_key_id
        raise Core::ValidationError.new("S3SseKmsKeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("S3SseKmsKeyId length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@s3_bucket_owner, @s3_bucket, @s3_key_prefix, @s3_sse_algorithm, @s3_sse_kms_key_id, @output_type)
  end
end
