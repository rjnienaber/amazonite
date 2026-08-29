private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class UpdateFunctionCodeRequest
    include JSON::Serializable

    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    @[JSON::Field(key: "ZipFile", converter: Core::Base64Converter)]
    property zip_file : Bytes | Nil

    @[JSON::Field(key: "S3Bucket")]
    property s3_bucket : String | Nil

    @[JSON::Field(key: "S3Key")]
    property s3_key : String | Nil

    @[JSON::Field(key: "S3ObjectVersion")]
    property s3_object_version : String | Nil

    @[JSON::Field(key: "S3ObjectStorageMode", converter: AL::S3ObjectStorageMode)]
    property s3_object_storage_mode : S3ObjectStorageMode | Nil

    @[JSON::Field(key: "ImageUri")]
    property image_uri : String | Nil

    @[JSON::Field(key: "Architectures", converter: Core::ArrayConverter(AL::Architecture))]
    property architectures : Array(Architecture) | Nil

    @[JSON::Field(key: "Publish")]
    property publish : Bool | Nil

    @[JSON::Field(key: "PublishTo", converter: AL::FunctionVersionLatestPublished)]
    property publish_to : FunctionVersionLatestPublished | Nil

    @[JSON::Field(key: "DryRun")]
    property dry_run : Bool | Nil

    @[JSON::Field(key: "RevisionId")]
    property revision_id : String | Nil

    @[JSON::Field(key: "SourceKMSKeyArn")]
    property source_kms_key_arn : String | Nil

    def initialize(
      @function_name : String,
      @zip_file : Bytes | Nil = nil,
      @s3_bucket : String | Nil = nil,
      @s3_key : String | Nil = nil,
      @s3_object_version : String | Nil = nil,
      @s3_object_storage_mode : S3ObjectStorageMode | Nil = nil,
      @image_uri : String | Nil = nil,
      @architectures : Array(Architecture) | Nil = nil,
      @publish : Bool | Nil = nil,
      @publish_to : FunctionVersionLatestPublished | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @revision_id : String | Nil = nil,
      @source_kms_key_arn : String | Nil = nil,
    )
    end
  end
end
