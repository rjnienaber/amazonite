module Amazonite::LambdaV1
  class Layer
    include JSON::Serializable

    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

    @[JSON::Field(key: "CodeSize")]
    property code_size : Int64 | Nil

    @[JSON::Field(key: "SigningProfileVersionArn")]
    property signing_profile_version_arn : String | Nil

    @[JSON::Field(key: "SigningJobArn")]
    property signing_job_arn : String | Nil

    def initialize(
      @arn : String | Nil = nil,
      @code_size : Int64 | Nil = nil,
      @signing_profile_version_arn : String | Nil = nil,
      @signing_job_arn : String | Nil = nil,
    )
    end
  end
end
