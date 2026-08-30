private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Represents the properties of the exported table.
  class ExportDescription
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the table export.
    @[JSON::Field(key: "ExportArn")]
    property export_arn : String | Nil

    # Export can be in one of the following states: IN_PROGRESS, COMPLETED, or FAILED.
    @[JSON::Field(key: "ExportStatus", converter: ADDB::ExportStatus)]
    property export_status : ExportStatus | Nil

    # The time at which the export task began.
    @[JSON::Field(key: "StartTime", converter: Core::AWSEpochConverter)]
    property start_time : Time | Nil

    # The time at which the export task completed.
    @[JSON::Field(key: "EndTime", converter: Core::AWSEpochConverter)]
    property end_time : Time | Nil

    # The name of the manifest file for the export task.
    @[JSON::Field(key: "ExportManifest")]
    property export_manifest : String | Nil

    # The Amazon Resource Name (ARN) of the table that was exported.
    @[JSON::Field(key: "TableArn")]
    property table_arn : String | Nil

    # Unique ID of the table that was exported.
    @[JSON::Field(key: "TableId")]
    property table_id : String | Nil

    # Point in time from which table data was exported.
    @[JSON::Field(key: "ExportTime", converter: Core::AWSEpochConverter)]
    property export_time : Time | Nil

    # The client token that was provided for the export task. A client token makes calls to
    # `ExportTableToPointInTimeInput` idempotent, meaning that multiple identical calls have the same
    # effect as one single call.
    @[JSON::Field(key: "ClientToken")]
    property client_token : String | Nil

    # The name of the Amazon S3 bucket containing the export.
    @[JSON::Field(key: "S3Bucket")]
    property s3_bucket : String | Nil

    # The ID of the Amazon Web Services account that owns the bucket containing the export.
    @[JSON::Field(key: "S3BucketOwner")]
    property s3_bucket_owner : String | Nil

    # The Amazon S3 bucket prefix used as the file name and path of the exported snapshot.
    @[JSON::Field(key: "S3Prefix")]
    property s3_prefix : String | Nil

    # Type of encryption used on the bucket where export data is stored. Valid values for
    # `S3SseAlgorithm` are:
    #
    # - `AES256` - server-side encryption with Amazon S3 managed keys
    #
    # - `KMS` - server-side encryption with KMS managed keys
    @[JSON::Field(key: "S3SseAlgorithm", converter: ADDB::S3SseAlgorithm)]
    property s3_sse_algorithm : S3SseAlgorithm | Nil

    # The ID of the KMS managed key used to encrypt the S3 bucket where export data is stored (if
    # applicable).
    @[JSON::Field(key: "S3SseKmsKeyId")]
    property s3_sse_kms_key_id : String | Nil

    # Status code for the result of the failed export.
    @[JSON::Field(key: "FailureCode")]
    property failure_code : String | Nil

    # Export failure reason description.
    @[JSON::Field(key: "FailureMessage")]
    property failure_message : String | Nil

    # The format of the exported data. Valid values for `ExportFormat` are `DYNAMODB_JSON` or `ION`.
    @[JSON::Field(key: "ExportFormat", converter: ADDB::ExportFormat)]
    property export_format : ExportFormat | Nil

    # The billable size of the table export.
    @[JSON::Field(key: "BilledSizeBytes")]
    property billed_size_bytes : Int64 | Nil

    # The number of items exported.
    @[JSON::Field(key: "ItemCount")]
    property item_count : Int64 | Nil

    # The type of export that was performed. Valid values are `FULL_EXPORT` or `INCREMENTAL_EXPORT`.
    @[JSON::Field(key: "ExportType", converter: ADDB::ExportType)]
    property export_type : ExportType | Nil

    # Optional object containing the parameters specific to an incremental export.
    @[JSON::Field(key: "IncrementalExportSpecification")]
    property incremental_export_specification : IncrementalExportSpecification | Nil

    def initialize(
      @export_arn : String | Nil = nil,
      @export_status : ExportStatus | Nil = nil,
      @start_time : Time | Nil = nil,
      @end_time : Time | Nil = nil,
      @export_manifest : String | Nil = nil,
      @table_arn : String | Nil = nil,
      @table_id : String | Nil = nil,
      @export_time : Time | Nil = nil,
      @client_token : String | Nil = nil,
      @s3_bucket : String | Nil = nil,
      @s3_bucket_owner : String | Nil = nil,
      @s3_prefix : String | Nil = nil,
      @s3_sse_algorithm : S3SseAlgorithm | Nil = nil,
      @s3_sse_kms_key_id : String | Nil = nil,
      @failure_code : String | Nil = nil,
      @failure_message : String | Nil = nil,
      @export_format : ExportFormat | Nil = nil,
      @billed_size_bytes : Int64 | Nil = nil,
      @item_count : Int64 | Nil = nil,
      @export_type : ExportType | Nil = nil,
      @incremental_export_specification : IncrementalExportSpecification | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @export_arn
        raise Core::ValidationError.new("ExportArn length must be >= 37") if value.size < 37
        raise Core::ValidationError.new("ExportArn length must be <= 1024") if value.size > 1024
      end

      if value = @table_arn
        raise Core::ValidationError.new("TableArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TableArn length must be <= 1024") if value.size > 1024
      end

      if value = @table_id
        raise Core::ValidationError.new("TableId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$"))
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

      if value = @billed_size_bytes
        raise Core::ValidationError.new("BilledSizeBytes value must be >= 0") if value < 0
      end

      if value = @item_count
        raise Core::ValidationError.new("ItemCount value must be >= 0") if value < 0
      end

      if value = @incremental_export_specification
        value.validate!
      end
    end

    def_equals_and_hash(@export_arn, @export_status, @start_time, @end_time, @export_manifest, @table_arn, @table_id, @export_time, @client_token, @s3_bucket, @s3_bucket_owner, @s3_prefix, @s3_sse_algorithm, @s3_sse_kms_key_id, @failure_code, @failure_message, @export_format, @billed_size_bytes, @item_count, @export_type, @incremental_export_specification)
  end
end
