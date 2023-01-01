module Amazonite::SsmV1
  class S3OutputLocation
    include JSON::Serializable

    @[JSON::Field(key: "OutputS3Region")]
    property output_s3_region : String | Nil

    @[JSON::Field(key: "OutputS3BucketName")]
    property output_s3_bucket_name : String | Nil

    @[JSON::Field(key: "OutputS3KeyPrefix")]
    property output_s3_key_prefix : String | Nil

    def initialize(
      @output_s3_region : String | Nil = nil,
      @output_s3_bucket_name : String | Nil = nil,
      @output_s3_key_prefix : String | Nil = nil
    )
    end
  end
end
