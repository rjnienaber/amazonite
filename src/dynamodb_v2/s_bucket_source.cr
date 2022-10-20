module Amazonite::DynamoDBv2
  class S3BucketSource
    include JSON::Serializable

    @[JSON::Field(key: "S3BucketOwner")]
    property s_bucket_owner : String | Nil

    @[JSON::Field(key: "S3Bucket")]
    property s_bucket : String

    @[JSON::Field(key: "S3KeyPrefix")]
    property s_key_prefix : String | Nil

    def initialize(
      @s_bucket : String,
      @s_bucket_owner : String | Nil = nil,
      @s_key_prefix : String | Nil = nil
    )
    end
  end
end
