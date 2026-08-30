private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Represents the properties of the table being imported into.
  class ImportTableDescription
    include JSON::Serializable

    # The Amazon Resource Number (ARN) corresponding to the import request.
    @[JSON::Field(key: "ImportArn")]
    property import_arn : String | Nil

    # The status of the import.
    @[JSON::Field(key: "ImportStatus", converter: ADDB::ImportStatus)]
    property import_status : ImportStatus | Nil

    # The Amazon Resource Number (ARN) of the table being imported into.
    @[JSON::Field(key: "TableArn")]
    property table_arn : String | Nil

    # The table id corresponding to the table created by import table process.
    @[JSON::Field(key: "TableId")]
    property table_id : String | Nil

    # The client token that was provided for the import task. Reusing the client token on retry makes
    # a call to `ImportTable` idempotent.
    @[JSON::Field(key: "ClientToken")]
    property client_token : String | Nil

    # Values for the S3 bucket the source file is imported from. Includes bucket name (required), key
    # prefix (optional) and bucket account owner ID (optional).
    @[JSON::Field(key: "S3BucketSource")]
    property s3_bucket_source : S3BucketSource | Nil

    # The number of errors occurred on importing the source file into the target table.
    @[JSON::Field(key: "ErrorCount")]
    property error_count : Int64 | Nil

    # The Amazon Resource Number (ARN) of the Cloudwatch Log Group associated with the target table.
    @[JSON::Field(key: "CloudWatchLogGroupArn")]
    property cloud_watch_log_group_arn : String | Nil

    # The format of the source data going into the target table.
    @[JSON::Field(key: "InputFormat", converter: ADDB::InputFormat)]
    property input_format : InputFormat | Nil

    # The format options for the data that was imported into the target table. There is one value,
    # CsvOption.
    @[JSON::Field(key: "InputFormatOptions")]
    property input_format_options : InputFormatOptions | Nil

    # The compression options for the data that has been imported into the target table. The values
    # are NONE, GZIP, or ZSTD.
    @[JSON::Field(key: "InputCompressionType", converter: ADDB::InputCompressionType)]
    property input_compression_type : InputCompressionType | Nil

    # The parameters for the new table that is being imported into.
    @[JSON::Field(key: "TableCreationParameters")]
    property table_creation_parameters : TableCreationParameters | Nil

    # The time when this import task started.
    @[JSON::Field(key: "StartTime", converter: Core::AWSEpochConverter)]
    property start_time : Time | Nil

    # The time at which the creation of the table associated with this import task completed.
    @[JSON::Field(key: "EndTime", converter: Core::AWSEpochConverter)]
    property end_time : Time | Nil

    # The total size of data processed from the source file, in Bytes.
    @[JSON::Field(key: "ProcessedSizeBytes")]
    property processed_size_bytes : Int64 | Nil

    # The total number of items processed from the source file.
    @[JSON::Field(key: "ProcessedItemCount")]
    property processed_item_count : Int64 | Nil

    # The number of items successfully imported into the new table.
    @[JSON::Field(key: "ImportedItemCount")]
    property imported_item_count : Int64 | Nil

    # The error code corresponding to the failure that the import job ran into during execution.
    @[JSON::Field(key: "FailureCode")]
    property failure_code : String | Nil

    # The error message corresponding to the failure that the import job ran into during execution.
    @[JSON::Field(key: "FailureMessage")]
    property failure_message : String | Nil

    def initialize(
      @import_arn : String | Nil = nil,
      @import_status : ImportStatus | Nil = nil,
      @table_arn : String | Nil = nil,
      @table_id : String | Nil = nil,
      @client_token : String | Nil = nil,
      @s3_bucket_source : S3BucketSource | Nil = nil,
      @error_count : Int64 | Nil = nil,
      @cloud_watch_log_group_arn : String | Nil = nil,
      @input_format : InputFormat | Nil = nil,
      @input_format_options : InputFormatOptions | Nil = nil,
      @input_compression_type : InputCompressionType | Nil = nil,
      @table_creation_parameters : TableCreationParameters | Nil = nil,
      @start_time : Time | Nil = nil,
      @end_time : Time | Nil = nil,
      @processed_size_bytes : Int64 | Nil = nil,
      @processed_item_count : Int64 | Nil = nil,
      @imported_item_count : Int64 | Nil = nil,
      @failure_code : String | Nil = nil,
      @failure_message : String | Nil = nil,
    )
    end

    def_equals_and_hash(@import_arn, @import_status, @table_arn, @table_id, @client_token, @s3_bucket_source, @error_count, @cloud_watch_log_group_arn, @input_format, @input_format_options, @input_compression_type, @table_creation_parameters, @start_time, @end_time, @processed_size_bytes, @processed_item_count, @imported_item_count, @failure_code, @failure_message)
  end
end
