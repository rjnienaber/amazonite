private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class OpsItemEventSummary
    include JSON::Serializable

    @[JSON::Field(key: "OpsItemId")]
    property ops_item_id : String | Nil

    @[JSON::Field(key: "EventId")]
    property event_id : String | Nil

    @[JSON::Field(key: "Source")]
    property source : String | Nil

    @[JSON::Field(key: "DetailType")]
    property detail_type : String | Nil

    @[JSON::Field(key: "Detail")]
    property detail : String | Nil

    @[JSON::Field(key: "CreatedBy")]
    property created_by : OpsItemIdentity | Nil

    @[JSON::Field(key: "CreatedTime", converter: Core::AWSEpochConverter)]
    property created_time : Time | Nil

    def initialize(
      @ops_item_id : String | Nil = nil,
      @event_id : String | Nil = nil,
      @source : String | Nil = nil,
      @detail_type : String | Nil = nil,
      @detail : String | Nil = nil,
      @created_by : OpsItemIdentity | Nil = nil,
      @created_time : Time | Nil = nil
    )
    end
  end
end
