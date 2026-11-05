private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  class DescribeBulkOperationInput
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the bulk operation to describe.
    @[JSON::Field(key: "BulkOperationArn")]
    property bulk_operation_arn : String

    def initialize(
      @bulk_operation_arn : String,
    )
    end

    def validate! : Nil
      if value = @bulk_operation_arn
        raise Core::ValidationError.new("BulkOperationArn length must be >= 37") if value.size < 37
        raise Core::ValidationError.new("BulkOperationArn length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@bulk_operation_arn)
  end
end
