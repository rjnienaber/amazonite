private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class InventoryDeletionStatusItem
    include JSON::Serializable

    @[JSON::Field(key: "DeletionId")]
    property deletion_id : String | Nil

    @[JSON::Field(key: "TypeName")]
    property type_name : String | Nil

    @[JSON::Field(key: "DeletionStartTime", converter: Core::AWSEpochConverter)]
    property deletion_start_time : Time | Nil

    @[JSON::Field(key: "LastStatus", converter: AS::InventoryDeletionStatus)]
    property last_status : InventoryDeletionStatus | Nil

    @[JSON::Field(key: "LastStatusMessage")]
    property last_status_message : String | Nil

    @[JSON::Field(key: "DeletionSummary")]
    property deletion_summary : InventoryDeletionSummary | Nil

    @[JSON::Field(key: "LastStatusUpdateTime", converter: Core::AWSEpochConverter)]
    property last_status_update_time : Time | Nil

    def initialize(
      @deletion_id : String | Nil = nil,
      @type_name : String | Nil = nil,
      @deletion_start_time : Time | Nil = nil,
      @last_status : InventoryDeletionStatus | Nil = nil,
      @last_status_message : String | Nil = nil,
      @deletion_summary : InventoryDeletionSummary | Nil = nil,
      @last_status_update_time : Time | Nil = nil
    )
    end
  end
end
