private alias ADDB = Amazonite::DynamoDB
private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  class ExportTableToPointInTimeInput
    include JSON::Serializable

    # The Amazon Resource Name (ARN) associated with the table to export.
    @[JSON::Field(key: "TableArn")]
    property table_arn : String

    # Time in the past from which to export table data, counted in seconds from the start of the Unix
    # epoch. The table export will be a snapshot of the table's state at this point in time.
    @[JSON::Field(key: "ExportTime", converter: Core::AWSEpochConverter)]
    property export_time : Time | Nil

    # Providing a `ClientToken` makes the call to `ExportTableToPointInTimeInput` idempotent, meaning
    # that multiple identical calls have the same effect as one single call.
    #
    # A client token is valid for 8 hours after the first request that uses it is completed. After 8
    # hours, any request with the same client token is treated as a new request. Do not resubmit the
    # same request with the same client token for more than 8 hours, or the result might not be
    # idempotent.
    #
    # If you submit a request with the same client token but a change in other parameters within the
    # 8-hour idempotency window, DynamoDB returns an `ExportConflictException`.
    @[JSON::Field(key: "ClientToken")]
    property client_token : String | Nil

    # The name of the Amazon S3 bucket to export the snapshot to.
    @[JSON::Field(key: "S3Bucket")]
    property s3_bucket : String

    # The ID of the Amazon Web Services account that owns the bucket the export will be stored in.
    #
    # S3BucketOwner is a required parameter when exporting to a S3 bucket in another account.
    @[JSON::Field(key: "S3BucketOwner")]
    property s3_bucket_owner : String | Nil

    # The Amazon S3 bucket prefix to use as the file name and path of the exported snapshot.
    @[JSON::Field(key: "S3Prefix")]
    property s3_prefix : String | Nil

    # Type of encryption used on the bucket where export data will be stored. Valid values for
    # `S3SseAlgorithm` are:
    #
    # - `AES256` - server-side encryption with Amazon S3 managed keys
    #
    # - `KMS` - server-side encryption with KMS managed keys
    @[JSON::Field(key: "S3SseAlgorithm", converter: ADDB::S3SseAlgorithm)]
    property s3_sse_algorithm : S3SseAlgorithm | Nil

    # The ID of the KMS managed key used to encrypt the S3 bucket where export data will be stored (if
    # applicable).
    @[JSON::Field(key: "S3SseKmsKeyId")]
    property s3_sse_kms_key_id : String | Nil

    # The format for the exported data. Valid values for `ExportFormat` are `DYNAMODB_JSON` or `ION`.
    @[JSON::Field(key: "ExportFormat", converter: ADDB::ExportFormat)]
    property export_format : ExportFormat | Nil

    # Choice of whether to execute as a full export or incremental export. Valid values are
    # FULL_EXPORT or INCREMENTAL_EXPORT. The default value is FULL_EXPORT. If INCREMENTAL_EXPORT is
    # provided, the IncrementalExportSpecification must also be used.
    @[JSON::Field(key: "ExportType", converter: ADDB::ExportType)]
    property export_type : ExportType | Nil

    # Optional object containing the parameters specific to an incremental export.
    @[JSON::Field(key: "IncrementalExportSpecification")]
    property incremental_export_specification : IncrementalExportSpecification | Nil

    def initialize(
      @table_arn : String,
      @s3_bucket : String,
      @export_time : Time | Nil = nil,
      @client_token : String | Nil = nil,
      @s3_bucket_owner : String | Nil = nil,
      @s3_prefix : String | Nil = nil,
      @s3_sse_algorithm : S3SseAlgorithm | Nil = nil,
      @s3_sse_kms_key_id : String | Nil = nil,
      @export_format : ExportFormat | Nil = nil,
      @export_type : ExportType | Nil = nil,
      @incremental_export_specification : IncrementalExportSpecification | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @table_arn
        raise Core::ValidationError.new("TableArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TableArn length must be <= 1024") if value.size > 1024
      end

      if value = @client_token
        raise Core::ValidationError.new("ClientToken does not match the required pattern") unless value.matches?(Regex.new("^[^\\$]+$"))
      end

      if value = @s3_bucket
        raise Core::ValidationError.new("S3Bucket length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("S3Bucket length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("S3Bucket does not match the required pattern") unless value.matches?(Regex.new("^[a-z0-9A-Z]+[\\.\\-\\w]*[a-z0-9A-Z]+$"))
      end

      if value = @s3_bucket_owner
        raise Core::ValidationError.new("S3BucketOwner does not match the required pattern") unless value.matches?(Regex.new("^[0-9]{12}$"))
      end

      if value = @s3_prefix
        raise Core::ValidationError.new("S3Prefix length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("S3Prefix length must be <= 1024") if value.size > 1024
      end

      if value = @s3_sse_kms_key_id
        raise Core::ValidationError.new("S3SseKmsKeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("S3SseKmsKeyId length must be <= 2048") if value.size > 2048
      end

      if value = @incremental_export_specification
        value.validate!
      end
    end

    def_equals_and_hash(@table_arn, @export_time, @client_token, @s3_bucket, @s3_bucket_owner, @s3_prefix, @s3_sse_algorithm, @s3_sse_kms_key_id, @export_format, @export_type, @incremental_export_specification)
  end
end
