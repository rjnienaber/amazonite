private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class UpdateOpsItemRequest
    include JSON::Serializable

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "OperationalData")]
    property operational_data : Hash(String, OpsItemDataValue) | Nil

    @[JSON::Field(key: "OperationalDataToDelete")]
    property operational_data_to_delete : Array(String) | Nil

    @[JSON::Field(key: "Notifications")]
    property notifications : Array(OpsItemNotification) | Nil

    @[JSON::Field(key: "Priority")]
    property priority : Int32 | Nil

    @[JSON::Field(key: "RelatedOpsItems")]
    property related_ops_items : Array(RelatedOpsItem) | Nil

    @[JSON::Field(key: "Status", converter: AS::OpsItemStatus)]
    property status : OpsItemStatus | Nil

    @[JSON::Field(key: "OpsItemId")]
    property ops_item_id : String

    @[JSON::Field(key: "Title")]
    property title : String | Nil

    @[JSON::Field(key: "Category")]
    property category : String | Nil

    @[JSON::Field(key: "Severity")]
    property severity : String | Nil

    @[JSON::Field(key: "ActualStartTime", converter: Core::AWSEpochConverter)]
    property actual_start_time : Time | Nil

    @[JSON::Field(key: "ActualEndTime", converter: Core::AWSEpochConverter)]
    property actual_end_time : Time | Nil

    @[JSON::Field(key: "PlannedStartTime", converter: Core::AWSEpochConverter)]
    property planned_start_time : Time | Nil

    @[JSON::Field(key: "PlannedEndTime", converter: Core::AWSEpochConverter)]
    property planned_end_time : Time | Nil

    def initialize(
      @ops_item_id : String,
      @description : String | Nil = nil,
      @operational_data : Hash(String, OpsItemDataValue) | Nil = nil,
      @operational_data_to_delete : Array(String) | Nil = nil,
      @notifications : Array(OpsItemNotification) | Nil = nil,
      @priority : Int32 | Nil = nil,
      @related_ops_items : Array(RelatedOpsItem) | Nil = nil,
      @status : OpsItemStatus | Nil = nil,
      @title : String | Nil = nil,
      @category : String | Nil = nil,
      @severity : String | Nil = nil,
      @actual_start_time : Time | Nil = nil,
      @actual_end_time : Time | Nil = nil,
      @planned_start_time : Time | Nil = nil,
      @planned_end_time : Time | Nil = nil
    )
    end
  end
end
