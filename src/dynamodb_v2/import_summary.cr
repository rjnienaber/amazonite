private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Summary information about the source file for the import.
  class ImportSummary
    include JSON::Serializable

    # The Amazon Resource Number (ARN) corresponding to the import request.
    @[JSON::Field(key: "ImportArn")]
    property import_arn : String | Nil

    # The status of the import operation.
    @[JSON::Field(key: "ImportStatus", converter: ADDB::ImportStatus)]
    property import_status : ImportStatus | Nil

    # The Amazon Resource Number (ARN) of the table being imported into.
    @[JSON::Field(key: "TableArn")]
    property table_arn : String | Nil

    # The path and S3 bucket of the source file that is being imported. This includes the S3Bucket
    # (required), S3KeyPrefix (optional) and S3BucketOwner (optional if the bucket is owned by the
    # requester).
    @[JSON::Field(key: "S3BucketSource")]
    property s3_bucket_source : S3BucketSource | Nil

    # The Amazon Resource Number (ARN) of the Cloudwatch Log Group associated with this import task.
    @[JSON::Field(key: "CloudWatchLogGroupArn")]
    property cloud_watch_log_group_arn : String | Nil

    # The format of the source data. Valid values are `CSV`, `DYNAMODB_JSON` or `ION`.
    @[JSON::Field(key: "InputFormat", converter: ADDB::InputFormat)]
    property input_format : InputFormat | Nil

    # The time at which this import task began.
    @[JSON::Field(key: "StartTime", converter: Core::AWSEpochConverter)]
    property start_time : Time | Nil

    # The time at which this import task ended.
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
      @end_time : Time | Nil = nil,
    )
    end
  end
end
