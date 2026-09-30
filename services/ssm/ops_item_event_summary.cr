private alias Core = Amazonite::Core

module Amazonite::Ssm
  # Summary information about an OpsItem event or that associated an OpsItem with a related item.
  class OpsItemEventSummary
    include JSON::Serializable

    # The ID of the OpsItem.
    @[JSON::Field(key: "OpsItemId")]
    property ops_item_id : String | Nil

    # The ID of the OpsItem event.
    @[JSON::Field(key: "EventId")]
    property event_id : String | Nil

    # The source of the OpsItem event.
    @[JSON::Field(key: "Source")]
    property source : String | Nil

    # The type of information provided as a detail.
    @[JSON::Field(key: "DetailType")]
    property detail_type : String | Nil

    # Specific information about the OpsItem event.
    @[JSON::Field(key: "Detail")]
    property detail : String | Nil

    # Information about the user or resource that created the OpsItem event.
    @[JSON::Field(key: "CreatedBy")]
    property created_by : OpsItemIdentity | Nil

    # The date and time the OpsItem event was created.
    @[JSON::Field(key: "CreatedTime", converter: Core::AWSEpochConverter)]
    property created_time : Time | Nil

    def initialize(
      @ops_item_id : String | Nil = nil,
      @event_id : String | Nil = nil,
      @source : String | Nil = nil,
      @detail_type : String | Nil = nil,
      @detail : String | Nil = nil,
      @created_by : OpsItemIdentity | Nil = nil,
      @created_time : Time | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @created_by
        value.validate!
      end
    end

    def_equals_and_hash(@ops_item_id, @event_id, @source, @detail_type, @detail, @created_by, @created_time)
  end
end
