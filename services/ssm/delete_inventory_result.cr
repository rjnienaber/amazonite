private alias Core = Amazonite::Core

module Amazonite::Ssm
  class DeleteInventoryResult
    include JSON::Serializable

    # Every `DeleteInventory` operation is assigned a unique ID. This option returns a unique ID. You
    # can use this ID to query the status of a delete operation. This option is useful for ensuring
    # that a delete operation has completed before you begin other operations.
    @[JSON::Field(key: "DeletionId")]
    property deletion_id : String | Nil

    # The name of the inventory data type specified in the request.
    @[JSON::Field(key: "TypeName")]
    property type_name : String | Nil

    # A summary of the delete operation. For more information about this summary, see [Deleting custom
    # inventory](https://docs.aws.amazon.com/systems-manager/latest/userguide/inventory-custom.html#delete-custom-inventory-summary)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "DeletionSummary")]
    property deletion_summary : InventoryDeletionSummary | Nil

    def initialize(
      @deletion_id : String | Nil = nil,
      @type_name : String | Nil = nil,
      @deletion_summary : InventoryDeletionSummary | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @deletion_id
        raise Core::ValidationError.new("DeletionId does not match the required pattern") unless value.matches?(Regex.new("^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$"))
      end

      if value = @type_name
        raise Core::ValidationError.new("TypeName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TypeName length must be <= 100") if value.size > 100
        raise Core::ValidationError.new("TypeName does not match the required pattern") unless value.matches?(Regex.new("^(AWS|Custom):.*$"))
      end

      if value = @deletion_summary
        value.validate!
      end
    end

    def_equals_and_hash(@deletion_id, @type_name, @deletion_summary)
  end
end
