private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # A ZIP archive that contains the contents of an [Lambda
  # layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html). You can specify
  # either an Amazon S3 location, or upload a layer archive directly.
  class LayerVersionContentInput
    include JSON::Serializable

    # The Amazon S3 bucket of the layer archive.
    @[JSON::Field(key: "S3Bucket")]
    property s3_bucket : String | Nil

    # The Amazon S3 key of the layer archive.
    @[JSON::Field(key: "S3Key")]
    property s3_key : String | Nil

    # For versioned objects, the version of the layer archive object to use.
    @[JSON::Field(key: "S3ObjectVersion")]
    property s3_object_version : String | Nil

    # Specifies how the layer archive is stored. Valid values:
    #
    # - `COPY` (default) – Uploads a copy of your layer archive to Lambda.
    #
    # - `REFERENCE` – Lambda references the layer archive from the specified Amazon S3 bucket.
    @[JSON::Field(key: "S3ObjectStorageMode", converter: AL::S3ObjectStorageMode)]
    property s3_object_storage_mode : S3ObjectStorageMode | Nil

    # The base64-encoded contents of the layer archive. Amazon Web Services SDK and Amazon Web
    # Services CLI clients handle the encoding for you.
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

    def_equals_and_hash(@s3_bucket, @s3_key, @s3_object_version, @s3_object_storage_mode, @zip_file)
  end
end
