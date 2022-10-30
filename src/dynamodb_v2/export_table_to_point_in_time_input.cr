private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class ExportTableToPointInTimeInput
    include JSON::Serializable

    @[JSON::Field(key: "TableArn")]
    property table_arn : String

    @[JSON::Field(key: "ExportTime", converter: Core::AWSEpochConverter)]
    property export_time : Time | Nil

    @[JSON::Field(key: "ClientToken")]
    property client_token : String | Nil

    @[JSON::Field(key: "S3Bucket")]
    property s3_bucket : String

    @[JSON::Field(key: "S3BucketOwner")]
    property s3_bucket_owner : String | Nil

    @[JSON::Field(key: "S3Prefix")]
    property s3_prefix : String | Nil

    @[JSON::Field(key: "S3SseAlgorithm", converter: ADDB::S3SseAlgorithm)]
    property s3_sse_algorithm : S3SseAlgorithm | Nil

    @[JSON::Field(key: "S3SseKmsKeyId")]
    property s3_sse_kms_key_id : String | Nil

    @[JSON::Field(key: "ExportFormat", converter: ADDB::ExportFormat)]
    property export_format : ExportFormat | Nil

    def initialize(
      @table_arn : String,
      @s3_bucket : String,
      @export_time : Time | Nil = nil,
      @client_token : String | Nil = nil,
      @s3_bucket_owner : String | Nil = nil,
      @s3_prefix : String | Nil = nil,
      @s3_sse_algorithm : S3SseAlgorithm | Nil = nil,
      @s3_sse_kms_key_id : String | Nil = nil,
      @export_format : ExportFormat | Nil = nil
    )
    end
  end
end
