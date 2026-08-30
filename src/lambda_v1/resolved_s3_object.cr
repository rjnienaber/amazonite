module Amazonite::LambdaV1
  # Details about the resolved Amazon S3 object that contains a function's deployment package.
  class ResolvedS3Object
    include JSON::Serializable

    # The Amazon S3 bucket that contains the deployment package.
    @[JSON::Field(key: "S3Bucket")]
    property s3_bucket : String | Nil

    # The Amazon S3 key of the deployment package.
    @[JSON::Field(key: "S3Key")]
    property s3_key : String | Nil

    # The version of the deployment package object.
    @[JSON::Field(key: "S3ObjectVersion")]
    property s3_object_version : String | Nil

    def initialize(
      @s3_bucket : String | Nil = nil,
      @s3_key : String | Nil = nil,
      @s3_object_version : String | Nil = nil,
    )
    end
  end
end
