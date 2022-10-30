private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class ImportSummary
    include JSON::Serializable

    @[JSON::Field(key: "ImportArn")]
    property import_arn : String | Nil

    @[JSON::Field(key: "ImportStatus", converter: ADDB::ImportStatus)]
    property import_status : ImportStatus | Nil

    @[JSON::Field(key: "TableArn")]
    property table_arn : String | Nil

    @[JSON::Field(key: "S3BucketSource")]
    property s3_bucket_source : S3BucketSource | Nil

    @[JSON::Field(key: "CloudWatchLogGroupArn")]
    property cloud_watch_log_group_arn : String | Nil

    @[JSON::Field(key: "InputFormat", converter: ADDB::InputFormat)]
    property input_format : InputFormat | Nil

    @[JSON::Field(key: "StartTime", converter: Core::AWSEpochConverter)]
    property start_time : Time | Nil

    @[JSON::Field(key: "EndTime", converter: Core::AWSEpochConverter)]
    property end_time : Time | Nil

    def initialize(
      @import_arn : String | Nil = nil,
      @import_status : ImportStatus | Nil = nil,
      @table_arn : String | Nil = nil,
      @s3_bucket_source : S3BucketSource | Nil = nil,
      @cloud_watch_log_group_arn : String | Nil = nil,
      @input_format : InputFormat | Nil = nil,
      @start_time : Time | Nil = nil,
      @end_time : Time | Nil = nil
    )
    end
  end
end
