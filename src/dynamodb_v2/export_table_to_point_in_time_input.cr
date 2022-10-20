private alias ADDB = Amazonite::DynamoDBv2
private alias AC = Amazonite::Core

module Amazonite::DynamoDBv2
  class ExportTableToPointInTimeInput
    include JSON::Serializable

    @[JSON::Field(key: "TableArn")]
    property table_arn : String

    @[JSON::Field(key: "ExportTime", converter: AC::AWSEpochConverter)]
    property export_time : Time | Nil

    @[JSON::Field(key: "ClientToken")]
    property client_token : String | Nil

    @[JSON::Field(key: "S3Bucket")]
    property s_bucket : String

    @[JSON::Field(key: "S3BucketOwner")]
    property s_bucket_owner : String | Nil

    @[JSON::Field(key: "S3Prefix")]
    property s_prefix : String | Nil

    @[JSON::Field(key: "S3SseAlgorithm", converter: ADDB::S3SseAlgorithm)]
    property s_sse_algorithm : S3SseAlgorithm | Nil

    @[JSON::Field(key: "S3SseKmsKeyId")]
    property s_sse_kms_key_id : String | Nil

    @[JSON::Field(key: "ExportFormat", converter: ADDB::ExportFormat)]
    property export_format : ExportFormat | Nil

    def initialize(
      @table_arn : String,
      @s_bucket : String,
      @export_time : Time | Nil = nil,
      @client_token : String | Nil = nil,
      @s_bucket_owner : String | Nil = nil,
      @s_prefix : String | Nil = nil,
      @s_sse_algorithm : S3SseAlgorithm | Nil = nil,
      @s_sse_kms_key_id : String | Nil = nil,
      @export_format : ExportFormat | Nil = nil
    )
    end
  end
end
