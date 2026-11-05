private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  class DescribeBulkOperationOutput
    include JSON::Serializable

    # Contains detailed information about the bulk operation.
    @[JSON::Field(key: "BulkOperationDescription")]
    property bulk_operation_description : BulkOperationDescription

    def initialize(
      @bulk_operation_description : BulkOperationDescription,
    )
    end

    def validate! : Nil
      if value = @bulk_operation_description
        value.validate!
      end
    end

    def_equals_and_hash(@bulk_operation_description)
  end
end
