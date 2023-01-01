module Amazonite::SsmV1
  class DeleteInventoryResult
    include JSON::Serializable

    @[JSON::Field(key: "DeletionId")]
    property deletion_id : String | Nil

    @[JSON::Field(key: "TypeName")]
    property type_name : String | Nil

    @[JSON::Field(key: "DeletionSummary")]
    property deletion_summary : InventoryDeletionSummary | Nil

    def initialize(
      @deletion_id : String | Nil = nil,
      @type_name : String | Nil = nil,
      @deletion_summary : InventoryDeletionSummary | Nil = nil
    )
    end
  end
end
