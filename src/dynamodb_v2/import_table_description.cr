private alias ADDB = Amazonite::DynamoDBv2
private alias AC = Amazonite::Core

module Amazonite::DynamoDBv2
  class ImportTableDescription
    include JSON::Serializable

    @[JSON::Field(key: "ImportArn")]
    property import_arn : String | Nil

    @[JSON::Field(key: "ImportStatus", converter: ADDB::ImportStatus)]
    property import_status : ImportStatus | Nil

    @[JSON::Field(key: "TableArn")]
    property table_arn : String | Nil

    @[JSON::Field(key: "TableId")]
    property table_id : String | Nil

    @[JSON::Field(key: "ClientToken")]
    property client_token : String | Nil

    @[JSON::Field(key: "S3BucketSource")]
    property s_bucket_source : S3BucketSource | Nil

    @[JSON::Field(key: "ErrorCount")]
    property error_count : Int64 | Nil

    @[JSON::Field(key: "CloudWatchLogGroupArn")]
    property cloud_watch_log_group_arn : String | Nil

    @[JSON::Field(key: "InputFormat", converter: ADDB::InputFormat)]
    property input_format : InputFormat | Nil

    @[JSON::Field(key: "InputFormatOptions")]
    property input_format_options : InputFormatOptions | Nil

    @[JSON::Field(key: "InputCompressionType", converter: ADDB::InputCompressionType)]
    property input_compression_type : InputCompressionType | Nil

    @[JSON::Field(key: "TableCreationParameters")]
    property table_creation_parameters : TableCreationParameters | Nil

    @[JSON::Field(key: "StartTime", converter: AC::AWSEpochConverter)]
    property start_time : Time | Nil

    @[JSON::Field(key: "EndTime", converter: AC::AWSEpochConverter)]
    property end_time : Time | Nil

    @[JSON::Field(key: "ProcessedSizeBytes")]
    property processed_size_bytes : Int64 | Nil

    @[JSON::Field(key: "ProcessedItemCount")]
    property processed_item_count : Int64 | Nil

    @[JSON::Field(key: "ImportedItemCount")]
    property imported_item_count : Int64 | Nil

    @[JSON::Field(key: "FailureCode")]
    property failure_code : String | Nil

    @[JSON::Field(key: "FailureMessage")]
    property failure_message : String | Nil

    def initialize(
      @import_arn : String | Nil = nil,
      @import_status : ImportStatus | Nil = nil,
      @table_arn : String | Nil = nil,
      @table_id : String | Nil = nil,
      @client_token : String | Nil = nil,
      @s_bucket_source : S3BucketSource | Nil = nil,
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
      @failure_message : String | Nil = nil
    )
    end
  end
end
