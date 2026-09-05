private alias AK = Amazonite::Kinesis
private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # Specifies the format of records read from the source stream.
  class RecordConfiguration
    include JSON::Serializable

    # The format of records on the source stream. Valid values:
    #
    # - `GSR_JSON` - Supported only for streaming table (Amazon S3 Tables) destinations.
    #
    # - `JSON` - Supported for both general purpose Amazon S3 and streaming table destinations.
    #
    # - `STRING` - Supported only for general purpose Amazon S3 destinations.
    #
    # - `BYTE_ARRAY` - Supported only for general purpose Amazon S3 destinations.
    @[JSON::Field(key: "RecordFormatType", converter: AK::RecordFormatType)]
    property record_format_type : RecordFormatType

    # The Amazon Resource Name (ARN) of the Amazon Web Services Glue Schema Registry schema used to
    # validate records. Required when the channel destination is a streaming table (Amazon S3 Tables),
    # for both the `JSON` and `GSR_JSON` record formats.
    @[JSON::Field(key: "GSRSchemaARN")]
    property gsr_schema_arn : String | Nil

    def initialize(
      @record_format_type : RecordFormatType,
      @gsr_schema_arn : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @gsr_schema_arn
        raise Core::ValidationError.new("GSRSchemaARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("GSRSchemaARN length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("GSRSchemaARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[-a-z0-9]*:glue:[-a-z0-9]+:\\d{12}:schema/[-a-zA-Z0-9_$#.]+/[-a-zA-Z0-9_$#.]+$"))
      end
    end

    def_equals_and_hash(@record_format_type, @gsr_schema_arn)
  end
end
