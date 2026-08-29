module Amazonite::LambdaV1
  class FunctionCodeLocation
    include JSON::Serializable

    @[JSON::Field(key: "RepositoryType")]
    property repository_type : String | Nil

    @[JSON::Field(key: "Location")]
    property location : String | Nil

    @[JSON::Field(key: "ImageUri")]
    property image_uri : String | Nil

    @[JSON::Field(key: "ResolvedImageUri")]
    property resolved_image_uri : String | Nil

    @[JSON::Field(key: "ResolvedS3Object")]
    property resolved_s3_object : ResolvedS3Object | Nil

    @[JSON::Field(key: "SourceKMSKeyArn")]
    property source_kms_key_arn : String | Nil

    @[JSON::Field(key: "Error")]
    property error : FunctionCodeLocationError | Nil

    def initialize(
      @repository_type : String | Nil = nil,
      @location : String | Nil = nil,
      @image_uri : String | Nil = nil,
      @resolved_image_uri : String | Nil = nil,
      @resolved_s3_object : ResolvedS3Object | Nil = nil,
      @source_kms_key_arn : String | Nil = nil,
      @error : FunctionCodeLocationError | Nil = nil,
    )
    end
  end
end
