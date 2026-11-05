private alias ADDB = Amazonite::DynamoDB
private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  # Contains detailed information about a bulk operation.
  class BulkOperationDescription
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the bulk operation.
    @[JSON::Field(key: "BulkOperationArn")]
    property bulk_operation_arn : String | Nil

    # The current status of the bulk operation can be one of the following values:
    #
    # IN_PROGRESS DynamoDB is processing the input.
    #
    # COMPLETED The bulk operation finished without parsing or validation errors. Condition-check
    # failures do not cause the operation to complete with errors.
    #
    # COMPLETED_WITH_ERRORS The bulk operation finished, but DynamoDB couldn't process at least one
    # input item because of a parsing or validation error. When you enable `ERROR` output, DynamoDB
    # writes the details to the configured Amazon S3 output location.
    #
    # CANCELLING DynamoDB accepted a cancellation request and is stopping the operation.
    #
    # CANCELLED DynamoDB stopped the operation after a cancellation request.
    #
    # FAILED The bulk operation failed. DynamoDB might write some items before the operation reaches
    # this status. See
    # [FailureCode](https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_BulkOperationDescription.html#DDB-Type-BulkOperationDescription-FailureCode)
    # and
    # [FailureMessage](https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_BulkOperationDescription.html#DDB-Type-BulkOperationDescription-FailureMessage)
    # for details.
    @[JSON::Field(key: "BulkOperationStatus", converter: ADDB::BulkOperationStatus)]
    property bulk_operation_status : BulkOperationStatus | Nil

    # A list containing identifying information for the table targeted by the bulk operation.
    @[JSON::Field(key: "TableDetails")]
    property table_details : Array(BulkOperationTableDetail) | Nil

    # The idempotency token associated with the start request.
    @[JSON::Field(key: "ClientToken")]
    property client_token : String | Nil

    # The Amazon S3 input configuration associated with the bulk operation.
    @[JSON::Field(key: "InputS3Configuration")]
    property input_s3_configuration : InputS3Configuration | Nil

    # The Amazon S3 output configuration associated with the bulk operation.
    @[JSON::Field(key: "OutputS3Configuration")]
    property output_s3_configuration : OutputS3Configuration | Nil

    # The time when DynamoDB accepted the start request.
    @[JSON::Field(key: "StartTime", converter: Core::AWSEpochConverter)]
    property start_time : Time | Nil

    # The time when the operation reached a terminal status. DynamoDB omits this value while the
    # operation remains in progress.
    @[JSON::Field(key: "EndTime", converter: Core::AWSEpochConverter)]
    property end_time : Time | Nil

    # The number of input items that DynamoDB has processed. This count includes successful writes,
    # parsing or validation failures, and condition-check failures.
    @[JSON::Field(key: "ProcessedItemCount")]
    property processed_item_count : Int64 | Nil

    # The number of bytes that DynamoDB has read from the Amazon S3 input objects.
    @[JSON::Field(key: "ProcessedInputBytes")]
    property processed_input_bytes : Int64 | Nil

    # The total size, in bytes, of the Amazon S3 input objects. DynamoDB omits this value until the
    # initial input-size calculation completes.
    @[JSON::Field(key: "TotalInputBytes")]
    property total_input_bytes : Int64 | Nil

    # Usage information for the table and its indexes.
    @[JSON::Field(key: "BulkOperationUsage")]
    property bulk_operation_usage : Array(BulkOperationUsage) | Nil

    # The number of processed input items that failed because of parsing or validation errors. This
    # count is included in `ProcessedItemCount`. Condition-check failures do not increase this count.
    @[JSON::Field(key: "FailedItemCount")]
    property failed_item_count : Int64 | Nil

    # A code that identifies why the bulk operation failed or was cancelled. DynamoDB returns this
    # value only when `BulkOperationStatus` is `FAILED` or `CANCELLED`.
    @[JSON::Field(key: "FailureCode")]
    property failure_code : String | Nil

    # A message that describes why the bulk operation failed or was cancelled. DynamoDB returns this
    # value only when `BulkOperationStatus` is `FAILED` or `CANCELLED`.
    @[JSON::Field(key: "FailureMessage")]
    property failure_message : String | Nil

    # The maximum write request unit rate configured for the bulk operation.
    @[JSON::Field(key: "MaxWriteRequestUnits")]
    property max_write_request_units : Int64 | Nil

    # The performance tier selected for the bulk operation. Valid values are `STANDARD` and
    # `ACCELERATED`. If the start request omitted this value, DynamoDB uses `STANDARD`.
    @[JSON::Field(key: "PerformanceTier", converter: ADDB::BulkOperationPerformanceTier)]
    property performance_tier : BulkOperationPerformanceTier | Nil

    def initialize(
      @bulk_operation_arn : String | Nil = nil,
      @bulk_operation_status : BulkOperationStatus | Nil = nil,
      @table_details : Array(BulkOperationTableDetail) | Nil = nil,
      @client_token : String | Nil = nil,
      @input_s3_configuration : InputS3Configuration | Nil = nil,
      @output_s3_configuration : OutputS3Configuration | Nil = nil,
      @start_time : Time | Nil = nil,
      @end_time : Time | Nil = nil,
      @processed_item_count : Int64 | Nil = nil,
      @processed_input_bytes : Int64 | Nil = nil,
      @total_input_bytes : Int64 | Nil = nil,
      @bulk_operation_usage : Array(BulkOperationUsage) | Nil = nil,
      @failed_item_count : Int64 | Nil = nil,
      @failure_code : String | Nil = nil,
      @failure_message : String | Nil = nil,
      @max_write_request_units : Int64 | Nil = nil,
      @performance_tier : BulkOperationPerformanceTier | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @bulk_operation_arn
        raise Core::ValidationError.new("BulkOperationArn length must be >= 37") if value.size < 37
        raise Core::ValidationError.new("BulkOperationArn length must be <= 1024") if value.size > 1024
      end

      if value = @table_details
        value.each(&.validate!)
      end

      if value = @client_token
        raise Core::ValidationError.new("ClientToken does not match the required pattern") unless value.matches?(Regex.new("^[^\\$]+$"))
      end

      if value = @input_s3_configuration
        value.validate!
      end

      if value = @output_s3_configuration
        value.validate!
      end

      if value = @processed_item_count
        raise Core::ValidationError.new("ProcessedItemCount value must be >= 0") if value < 0
      end

      if value = @processed_input_bytes
        raise Core::ValidationError.new("ProcessedInputBytes value must be >= 0") if value < 0
      end

      if value = @total_input_bytes
        raise Core::ValidationError.new("TotalInputBytes value must be >= 0") if value < 0
      end

      if value = @bulk_operation_usage
        value.each(&.validate!)
      end

      if value = @failed_item_count
        raise Core::ValidationError.new("FailedItemCount value must be >= 0") if value < 0
      end

      if value = @max_write_request_units
        raise Core::ValidationError.new("MaxWriteRequestUnits value must be >= 1024") if value < 1024
      end
    end

    def_equals_and_hash(@bulk_operation_arn, @bulk_operation_status, @table_details, @client_token, @input_s3_configuration, @output_s3_configuration, @start_time, @end_time, @processed_item_count, @processed_input_bytes, @total_input_bytes, @bulk_operation_usage, @failed_item_count, @failure_code, @failure_message, @max_write_request_units, @performance_tier)
  end
end
