module Amazonite::DynamoDBV2
  # The S3 bucket that is being imported from.
  class S3BucketSource
    include JSON::Serializable

    # The account number of the S3 bucket that is being imported from. If the bucket is owned by the
    # requester this is optional.
    @[JSON::Field(key: "S3BucketOwner")]
    property s3_bucket_owner : String | Nil

    # The S3 bucket that is being imported from.
    @[JSON::Field(key: "S3Bucket")]
    property s3_bucket : String

    # The key prefix shared by all S3 Objects that are being imported.
    @[JSON::Field(key: "S3KeyPrefix")]
    property s3_key_prefix : String | Nil

    def initialize(
      @s3_bucket : String,
      @s3_bucket_owner : String | Nil = nil,
      @s3_key_prefix : String | Nil = nil,
    )
    end
  end
end
