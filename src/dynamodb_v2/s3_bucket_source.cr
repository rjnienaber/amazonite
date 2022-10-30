module Amazonite::DynamoDBV2
  class S3BucketSource
    include JSON::Serializable

    @[JSON::Field(key: "S3BucketOwner")]
    property s3_bucket_owner : String | Nil

    @[JSON::Field(key: "S3Bucket")]
    property s3_bucket : String

    @[JSON::Field(key: "S3KeyPrefix")]
    property s3_key_prefix : String | Nil

    def initialize(
      @s3_bucket : String,
      @s3_bucket_owner : String | Nil = nil,
      @s3_key_prefix : String | Nil = nil
    )
    end
  end
end
