module Amazonite::LambdaV1
  # Details about a version of an [Lambda
  # layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html).
  class LayerVersionContentOutput
    include JSON::Serializable

    # A link to the layer archive in Amazon S3 that is valid for 10 minutes.
    @[JSON::Field(key: "Location")]
    property location : String | Nil

    # The SHA-256 hash of the layer archive.
    @[JSON::Field(key: "CodeSha256")]
    property code_sha_256 : String | Nil

    # The size of the layer archive in bytes.
    @[JSON::Field(key: "CodeSize")]
    property code_size : Int64 | Nil

    # The Amazon Resource Name (ARN) for a signing profile version.
    @[JSON::Field(key: "SigningProfileVersionArn")]
    property signing_profile_version_arn : String | Nil

    # The Amazon Resource Name (ARN) of a signing job.
    @[JSON::Field(key: "SigningJobArn")]
    property signing_job_arn : String | Nil

    # The resolved Amazon S3 object that contains the layer archive.
    @[JSON::Field(key: "ResolvedS3Object")]
    property resolved_s3_object : ResolvedS3Object | Nil

    def initialize(
      @location : String | Nil = nil,
      @code_sha_256 : String | Nil = nil,
      @code_size : Int64 | Nil = nil,
      @signing_profile_version_arn : String | Nil = nil,
      @signing_job_arn : String | Nil = nil,
      @resolved_s3_object : ResolvedS3Object | Nil = nil,
    )
    end

    def_equals_and_hash(@location, @code_sha_256, @code_size, @signing_profile_version_arn, @signing_job_arn, @resolved_s3_object)
  end
end
