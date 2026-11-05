private alias ADDB = Amazonite::DynamoDB
private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  # Contains summary information about a bulk operation.
  class BulkOperationSummary
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the bulk operation.
    @[JSON::Field(key: "BulkOperationArn")]
    property bulk_operation_arn : String

    # The current status of the bulk operation.
    @[JSON::Field(key: "BulkOperationStatus", converter: ADDB::BulkOperationStatus)]
    property bulk_operation_status : BulkOperationStatus

    # The time when DynamoDB accepted the start request.
    @[JSON::Field(key: "StartTime", converter: Core::AWSEpochConverter)]
    property start_time : Time

    # The time when the operation reached a terminal status. DynamoDB omits this value while the
    # operation remains in progress.
    @[JSON::Field(key: "EndTime", converter: Core::AWSEpochConverter)]
    property end_time : Time | Nil

    def initialize(
      @bulk_operation_arn : String,
      @bulk_operation_status : BulkOperationStatus,
      @start_time : Time,
      @end_time : Time | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @bulk_operation_arn
        raise Core::ValidationError.new("BulkOperationArn length must be >= 37") if value.size < 37
        raise Core::ValidationError.new("BulkOperationArn length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@bulk_operation_arn, @bulk_operation_status, @start_time, @end_time)
  end
end
