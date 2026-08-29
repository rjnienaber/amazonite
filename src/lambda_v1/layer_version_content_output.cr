module Amazonite::LambdaV1
  class LayerVersionContentOutput
    include JSON::Serializable

    @[JSON::Field(key: "Location")]
    property location : String | Nil

    @[JSON::Field(key: "CodeSha256")]
    property code_sha_256 : String | Nil

    @[JSON::Field(key: "CodeSize")]
    property code_size : Int64 | Nil

    @[JSON::Field(key: "SigningProfileVersionArn")]
    property signing_profile_version_arn : String | Nil

    @[JSON::Field(key: "SigningJobArn")]
    property signing_job_arn : String | Nil

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
  end
end
