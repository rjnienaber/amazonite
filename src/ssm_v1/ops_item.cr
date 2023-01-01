private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class OpsItem
    include JSON::Serializable

    @[JSON::Field(key: "CreatedBy")]
    property created_by : String | Nil

    @[JSON::Field(key: "OpsItemType")]
    property ops_item_type : String | Nil

    @[JSON::Field(key: "CreatedTime", converter: Core::AWSEpochConverter)]
    property created_time : Time | Nil

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "LastModifiedBy")]
    property last_modified_by : String | Nil

    @[JSON::Field(key: "LastModifiedTime", converter: Core::AWSEpochConverter)]
    property last_modified_time : Time | Nil

    @[JSON::Field(key: "Notifications")]
    property notifications : Array(OpsItemNotification) | Nil

    @[JSON::Field(key: "Priority")]
    property priority : Int32 | Nil

    @[JSON::Field(key: "RelatedOpsItems")]
    property related_ops_items : Array(RelatedOpsItem) | Nil

    @[JSON::Field(key: "Status", converter: AS::OpsItemStatus)]
    property status : OpsItemStatus | Nil

    @[JSON::Field(key: "OpsItemId")]
    property ops_item_id : String | Nil

    @[JSON::Field(key: "Version")]
    property version : String | Nil

    @[JSON::Field(key: "Title")]
    property title : String | Nil

    @[JSON::Field(key: "Source")]
    property source : String | Nil

    @[JSON::Field(key: "OperationalData")]
    property operational_data : Hash(String, OpsItemDataValue) | Nil

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
      @created_by : String | Nil = nil,
      @ops_item_type : String | Nil = nil,
      @created_time : Time | Nil = nil,
      @description : String | Nil = nil,
      @last_modified_by : String | Nil = nil,
      @last_modified_time : Time | Nil = nil,
      @notifications : Array(OpsItemNotification) | Nil = nil,
      @priority : Int32 | Nil = nil,
      @related_ops_items : Array(RelatedOpsItem) | Nil = nil,
      @status : OpsItemStatus | Nil = nil,
      @ops_item_id : String | Nil = nil,
      @version : String | Nil = nil,
      @title : String | Nil = nil,
      @source : String | Nil = nil,
      @operational_data : Hash(String, OpsItemDataValue) | Nil = nil,
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
