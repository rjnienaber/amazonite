private alias ADDB = Amazonite::DynamoDB
private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  class StartBulkPutItemsInput
    include JSON::Serializable

    # A unique, case-sensitive identifier that ensures the bulk operation starts no more than one
    # time. During the 8 hours after the initial request, repeated requests that use the same token
    # and parameters return the same bulk operation. If a request reuses the token with different
    # parameters, DynamoDB returns an `IdempotentParameterMismatchException`. If you omit the token,
    # an Amazon Web Services SDK automatically generates one.
    @[JSON::Field(key: "ClientToken")]
    property client_token : String | Nil

    # The Amazon S3 location, data format, and compression settings for the input objects.
    @[JSON::Field(key: "InputS3Configuration")]
    property input_s3_configuration : InputS3Configuration

    # The Amazon S3 location, encryption settings, and output types for the bulk operation.
    @[JSON::Field(key: "OutputS3Configuration")]
    property output_s3_configuration : OutputS3Configuration

    # The name or ARN of the existing DynamoDB table that receives the items.
    @[JSON::Field(key: "TableName")]
    property table_name : String

    # The maximum rate, in write request units per second, at which the bulk operation attempts to
    # write. The value must be at least 1,024. With this setting, you limit only the bulk operation;
    # the table's provisioned or on-demand capacity settings don't change. The actual write rate can
    # be lower.
    @[JSON::Field(key: "MaxWriteRequestUnits")]
    property max_write_request_units : Int64 | Nil

    # The performance tier for the bulk operation. Valid values are `STANDARD` and `ACCELERATED`. If
    # you don't specify a value, the operation uses `STANDARD`.
    @[JSON::Field(key: "PerformanceTier", converter: ADDB::BulkOperationPerformanceTier)]
    property performance_tier : BulkOperationPerformanceTier | Nil

    def initialize(
      @input_s3_configuration : InputS3Configuration,
      @output_s3_configuration : OutputS3Configuration,
      @table_name : String,
      @client_token : String | Nil = nil,
      @max_write_request_units : Int64 | Nil = nil,
      @performance_tier : BulkOperationPerformanceTier | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @client_token
        raise Core::ValidationError.new("ClientToken does not match the required pattern") unless value.matches?(Regex.new("^[^\\$]+$"))
      end

      if value = @input_s3_configuration
        value.validate!
      end

      if value = @output_s3_configuration
        value.validate!
      end

      if value = @table_name
        raise Core::ValidationError.new("TableName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TableName length must be <= 1024") if value.size > 1024
      end

      if value = @max_write_request_units
        raise Core::ValidationError.new("MaxWriteRequestUnits value must be >= 1024") if value < 1024
      end
    end

    def_equals_and_hash(@client_token, @input_s3_configuration, @output_s3_configuration, @table_name, @max_write_request_units, @performance_tier)
  end
end
