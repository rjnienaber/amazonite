private alias ADDB = Amazonite::DynamoDB
private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  class CancelBulkOperationOutput
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the bulk operation for which DynamoDB accepted the
    # cancellation request.
    @[JSON::Field(key: "BulkOperationArn")]
    property bulk_operation_arn : String

    # The status returned after DynamoDB accepts the cancellation request. This value is `CANCELLING`.
    # Use `DescribeBulkOperation` to determine when the operation reaches `CANCELLED`.
    @[JSON::Field(key: "BulkOperationStatus", converter: ADDB::BulkOperationStatus)]
    property bulk_operation_status : BulkOperationStatus

    def initialize(
      @bulk_operation_arn : String,
      @bulk_operation_status : BulkOperationStatus,
    )
    end

    def validate! : Nil
      if value = @bulk_operation_arn
        raise Core::ValidationError.new("BulkOperationArn length must be >= 37") if value.size < 37
        raise Core::ValidationError.new("BulkOperationArn length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@bulk_operation_arn, @bulk_operation_status)
  end
end
