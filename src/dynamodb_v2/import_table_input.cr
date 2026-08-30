private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class ImportTableInput
    include JSON::Serializable

    # Providing a `ClientToken` makes the call to `ImportTableInput` idempotent, meaning that multiple
    # identical calls have the same effect as one single call.
    #
    # A client token is valid for 8 hours after the first request that uses it is completed. After 8
    # hours, any request with the same client token is treated as a new request. Do not resubmit the
    # same request with the same client token for more than 8 hours, or the result might not be
    # idempotent.
    #
    # If you submit a request with the same client token but a change in other parameters within the
    # 8-hour idempotency window, DynamoDB returns an `IdempotentParameterMismatch` exception.
    @[JSON::Field(key: "ClientToken")]
    property client_token : String | Nil

    # The S3 bucket that provides the source for the import.
    @[JSON::Field(key: "S3BucketSource")]
    property s3_bucket_source : S3BucketSource

    # The format of the source data. Valid values for `ImportFormat` are `CSV`, `DYNAMODB_JSON` or
    # `ION`.
    @[JSON::Field(key: "InputFormat", converter: ADDB::InputFormat)]
    property input_format : InputFormat

    # Additional properties that specify how the input is formatted,
    @[JSON::Field(key: "InputFormatOptions")]
    property input_format_options : InputFormatOptions | Nil

    # Type of compression to be used on the input coming from the imported table.
    @[JSON::Field(key: "InputCompressionType", converter: ADDB::InputCompressionType)]
    property input_compression_type : InputCompressionType | Nil

    # Parameters for the table to import the data into.
    @[JSON::Field(key: "TableCreationParameters")]
    property table_creation_parameters : TableCreationParameters

    def initialize(
      @s3_bucket_source : S3BucketSource,
      @input_format : InputFormat,
      @table_creation_parameters : TableCreationParameters,
      @client_token : String | Nil = nil,
      @input_format_options : InputFormatOptions | Nil = nil,
      @input_compression_type : InputCompressionType | Nil = nil,
    )
    end

    def_equals_and_hash(@client_token, @s3_bucket_source, @input_format, @input_format_options, @input_compression_type, @table_creation_parameters)
  end
end
