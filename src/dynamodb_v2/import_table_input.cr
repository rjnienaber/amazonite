private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class ImportTableInput
    include JSON::Serializable

    @[JSON::Field(key: "ClientToken")]
    property client_token : String | Nil

    @[JSON::Field(key: "S3BucketSource")]
    property s_bucket_source : S3BucketSource

    @[JSON::Field(key: "InputFormat", converter: ADDB::InputFormat)]
    property input_format : InputFormat

    @[JSON::Field(key: "InputFormatOptions")]
    property input_format_options : InputFormatOptions | Nil

    @[JSON::Field(key: "InputCompressionType", converter: ADDB::InputCompressionType)]
    property input_compression_type : InputCompressionType | Nil

    @[JSON::Field(key: "TableCreationParameters")]
    property table_creation_parameters : TableCreationParameters

    def initialize(
      @s_bucket_source : S3BucketSource,
      @input_format : InputFormat,
      @table_creation_parameters : TableCreationParameters,
      @client_token : String | Nil = nil,
      @input_format_options : InputFormatOptions | Nil = nil,
      @input_compression_type : InputCompressionType | Nil = nil
    )
    end
  end
end