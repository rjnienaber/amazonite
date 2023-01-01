module Amazonite::SsmV1
  class LoggingInfo
    include JSON::Serializable

    @[JSON::Field(key: "S3BucketName")]
    property s3_bucket_name : String

    @[JSON::Field(key: "S3KeyPrefix")]
    property s3_key_prefix : String | Nil

    @[JSON::Field(key: "S3Region")]
    property s3_region : String

    def initialize(
      @s3_bucket_name : String,
      @s3_region : String,
      @s3_key_prefix : String | Nil = nil
    )
    end
  end
end
