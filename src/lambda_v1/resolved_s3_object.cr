module Amazonite::LambdaV1
  class ResolvedS3Object
    include JSON::Serializable

    @[JSON::Field(key: "S3Bucket")]
    property s3_bucket : String | Nil

    @[JSON::Field(key: "S3Key")]
    property s3_key : String | Nil

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
