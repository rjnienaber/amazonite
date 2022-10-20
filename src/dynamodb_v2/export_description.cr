private alias ADDB = Amazonite::DynamoDBv2
private alias AC = Amazonite::Core

module Amazonite::DynamoDBv2
  class ExportDescription
    include JSON::Serializable

    @[JSON::Field(key: "ExportArn")]
    property export_arn : String | Nil

    @[JSON::Field(key: "ExportStatus", converter: ADDB::ExportStatus)]
    property export_status : ExportStatus | Nil

    @[JSON::Field(key: "StartTime", converter: AC::AWSEpochConverter)]
    property start_time : Time | Nil

    @[JSON::Field(key: "EndTime", converter: AC::AWSEpochConverter)]
    property end_time : Time | Nil

    @[JSON::Field(key: "ExportManifest")]
    property export_manifest : String | Nil

    @[JSON::Field(key: "TableArn")]
    property table_arn : String | Nil

    @[JSON::Field(key: "TableId")]
    property table_id : String | Nil

    @[JSON::Field(key: "ExportTime", converter: AC::AWSEpochConverter)]
    property export_time : Time | Nil

    @[JSON::Field(key: "ClientToken")]
    property client_token : String | Nil

    @[JSON::Field(key: "S3Bucket")]
    property s_bucket : String | Nil

    @[JSON::Field(key: "S3BucketOwner")]
    property s_bucket_owner : String | Nil

    @[JSON::Field(key: "S3Prefix")]
    property s_prefix : String | Nil

    @[JSON::Field(key: "S3SseAlgorithm", converter: ADDB::S3SseAlgorithm)]
    property s_sse_algorithm : S3SseAlgorithm | Nil

    @[JSON::Field(key: "S3SseKmsKeyId")]
    property s_sse_kms_key_id : String | Nil

    @[JSON::Field(key: "FailureCode")]
    property failure_code : String | Nil

    @[JSON::Field(key: "FailureMessage")]
    property failure_message : String | Nil

    @[JSON::Field(key: "ExportFormat", converter: ADDB::ExportFormat)]
    property export_format : ExportFormat | Nil

    @[JSON::Field(key: "BilledSizeBytes")]
    property billed_size_bytes : Int64 | Nil

    @[JSON::Field(key: "ItemCount")]
    property item_count : Int64 | Nil

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
      @s_bucket : String | Nil = nil,
      @s_bucket_owner : String | Nil = nil,
      @s_prefix : String | Nil = nil,
      @s_sse_algorithm : S3SseAlgorithm | Nil = nil,
      @s_sse_kms_key_id : String | Nil = nil,
      @failure_code : String | Nil = nil,
      @failure_message : String | Nil = nil,
      @export_format : ExportFormat | Nil = nil,
      @billed_size_bytes : Int64 | Nil = nil,
      @item_count : Int64 | Nil = nil
    )
    end
  end
end
