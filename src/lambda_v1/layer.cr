module Amazonite::LambdaV1
  # An [Lambda layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html).
  class Layer
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the function layer.
    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

    # The size of the layer archive in bytes.
    @[JSON::Field(key: "CodeSize")]
    property code_size : Int64 | Nil

    # The Amazon Resource Name (ARN) for a signing profile version.
    @[JSON::Field(key: "SigningProfileVersionArn")]
    property signing_profile_version_arn : String | Nil

    # The Amazon Resource Name (ARN) of a signing job.
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
