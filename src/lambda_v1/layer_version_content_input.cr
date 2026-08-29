private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class LayerVersionContentInput
    include JSON::Serializable

    @[JSON::Field(key: "S3Bucket")]
    property s3_bucket : String | Nil

    @[JSON::Field(key: "S3Key")]
    property s3_key : String | Nil

    @[JSON::Field(key: "S3ObjectVersion")]
    property s3_object_version : String | Nil

    @[JSON::Field(key: "S3ObjectStorageMode", converter: AL::S3ObjectStorageMode)]
    property s3_object_storage_mode : S3ObjectStorageMode | Nil

    @[JSON::Field(key: "ZipFile", converter: Core::Base64Converter)]
    property zip_file : Bytes | Nil

    def initialize(
      @s3_bucket : String | Nil = nil,
      @s3_key : String | Nil = nil,
      @s3_object_version : String | Nil = nil,
      @s3_object_storage_mode : S3ObjectStorageMode | Nil = nil,
      @zip_file : Bytes | Nil = nil,
    )
    end
  end
end
