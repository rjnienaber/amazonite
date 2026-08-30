private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @output_s3_region
        raise Core::ValidationError.new("OutputS3Region length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("OutputS3Region length must be <= 20") if value.size > 20
      end

      if value = @output_s3_bucket_name
        raise Core::ValidationError.new("OutputS3BucketName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("OutputS3BucketName length must be <= 63") if value.size > 63
      end

      if value = @output_s3_key_prefix
        raise Core::ValidationError.new("OutputS3KeyPrefix length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("OutputS3KeyPrefix length must be <= 500") if value.size > 500
      end
    end

    def_equals_and_hash(@output_s3_region, @output_s3_bucket_name, @output_s3_key_prefix)
  end
end
