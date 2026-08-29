private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class AlarmHistoryItem
    include JSON::Serializable

    @[JSON::Field(key: "AlarmName")]
    property alarm_name : String | Nil

    @[JSON::Field(key: "AlarmContributorId")]
    property alarm_contributor_id : String | Nil

    @[JSON::Field(key: "AlarmType", converter: ACW::AlarmType)]
    property alarm_type : AlarmType | Nil

    @[JSON::Field(key: "Timestamp", converter: Core::AWSEpochConverter)]
    property timestamp : Time | Nil

    @[JSON::Field(key: "HistoryItemType", converter: ACW::HistoryItemType)]
    property history_item_type : HistoryItemType | Nil

    @[JSON::Field(key: "HistorySummary")]
    property history_summary : String | Nil

    @[JSON::Field(key: "HistoryData")]
    property history_data : String | Nil

    @[JSON::Field(key: "AlarmContributorAttributes")]
    property alarm_contributor_attributes : Hash(String, String) | Nil

    def initialize(
      @alarm_name : String | Nil = nil,
      @alarm_contributor_id : String | Nil = nil,
      @alarm_type : AlarmType | Nil = nil,
      @timestamp : Time | Nil = nil,
      @history_item_type : HistoryItemType | Nil = nil,
      @history_summary : String | Nil = nil,
      @history_data : String | Nil = nil,
      @alarm_contributor_attributes : Hash(String, String) | Nil = nil,
    )
    end
  end
end
