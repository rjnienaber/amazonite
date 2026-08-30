module Amazonite::SsmV1
  # An S3 bucket where you want to store the results of this request.
  class S3OutputLocation
    include JSON::Serializable

    # The Amazon Web Services Region of the S3 bucket.
    @[JSON::Field(key: "OutputS3Region")]
    property output_s3_region : String | Nil

    # The name of the S3 bucket.
    @[JSON::Field(key: "OutputS3BucketName")]
    property output_s3_bucket_name : String | Nil

    # The S3 bucket subfolder.
    @[JSON::Field(key: "OutputS3KeyPrefix")]
    property output_s3_key_prefix : String | Nil

    def initialize(
      @output_s3_region : String | Nil = nil,
      @output_s3_bucket_name : String | Nil = nil,
      @output_s3_key_prefix : String | Nil = nil,
    )
    end
  end
end
