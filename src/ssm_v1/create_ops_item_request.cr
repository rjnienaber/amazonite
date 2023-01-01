private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class CreateOpsItemRequest
    include JSON::Serializable

    @[JSON::Field(key: "Description")]
    property description : String

    @[JSON::Field(key: "OpsItemType")]
    property ops_item_type : String | Nil

    @[JSON::Field(key: "OperationalData")]
    property operational_data : Hash(String, OpsItemDataValue) | Nil

    @[JSON::Field(key: "Notifications")]
    property notifications : Array(OpsItemNotification) | Nil

    @[JSON::Field(key: "Priority")]
    property priority : Int32 | Nil

    @[JSON::Field(key: "RelatedOpsItems")]
    property related_ops_items : Array(RelatedOpsItem) | Nil

    @[JSON::Field(key: "Source")]
    property source : String

    @[JSON::Field(key: "Title")]
    property title : String

    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

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
      @description : String,
      @source : String,
      @title : String,
      @ops_item_type : String | Nil = nil,
      @operational_data : Hash(String, OpsItemDataValue) | Nil = nil,
      @notifications : Array(OpsItemNotification) | Nil = nil,
      @priority : Int32 | Nil = nil,
      @related_ops_items : Array(RelatedOpsItem) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
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
