private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Status information returned by the `DeleteInventory` operation.
  class InventoryDeletionStatusItem
    include JSON::Serializable

    # The deletion ID returned by the `DeleteInventory` operation.
    @[JSON::Field(key: "DeletionId")]
    property deletion_id : String | Nil

    # The name of the inventory data type.
    @[JSON::Field(key: "TypeName")]
    property type_name : String | Nil

    # The UTC timestamp when the delete operation started.
    @[JSON::Field(key: "DeletionStartTime", converter: Core::AWSEpochConverter)]
    property deletion_start_time : Time | Nil

    # The status of the operation. Possible values are InProgress and Complete.
    @[JSON::Field(key: "LastStatus", converter: AS::InventoryDeletionStatus)]
    property last_status : InventoryDeletionStatus | Nil

    # Information about the status.
    @[JSON::Field(key: "LastStatusMessage")]
    property last_status_message : String | Nil

    # Information about the delete operation. For more information about this summary, see
    # [Understanding the delete inventory
    # summary](https://docs.aws.amazon.com/systems-manager/latest/userguide/inventory-custom.html#delete-custom-inventory)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "DeletionSummary")]
    property deletion_summary : InventoryDeletionSummary | Nil

    # The UTC timestamp of when the last status report.
    @[JSON::Field(key: "LastStatusUpdateTime", converter: Core::AWSEpochConverter)]
    property last_status_update_time : Time | Nil

    def initialize(
      @deletion_id : String | Nil = nil,
      @type_name : String | Nil = nil,
      @deletion_start_time : Time | Nil = nil,
      @last_status : InventoryDeletionStatus | Nil = nil,
      @last_status_message : String | Nil = nil,
      @deletion_summary : InventoryDeletionSummary | Nil = nil,
      @last_status_update_time : Time | Nil = nil,
    )
    end
  end
end
