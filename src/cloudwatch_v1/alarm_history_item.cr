private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  # Represents the history of a specific alarm.
  class AlarmHistoryItem
    include JSON::Serializable

    # The descriptive name for the alarm.
    @[JSON::Field(key: "AlarmName")]
    property alarm_name : String | Nil

    # The unique identifier of the alarm contributor associated with this history item, if applicable.
    @[JSON::Field(key: "AlarmContributorId")]
    property alarm_contributor_id : String | Nil

    # The type of alarm, either metric alarm or composite alarm.
    @[JSON::Field(key: "AlarmType", converter: ACW::AlarmType)]
    property alarm_type : AlarmType | Nil

    # The time stamp for the alarm history item.
    @[JSON::Field(key: "Timestamp", converter: Core::AWSEpochConverter)]
    property timestamp : Time | Nil

    # The type of alarm history item.
    @[JSON::Field(key: "HistoryItemType", converter: ACW::HistoryItemType)]
    property history_item_type : HistoryItemType | Nil

    # A summary of the alarm history, in text format.
    @[JSON::Field(key: "HistorySummary")]
    property history_summary : String | Nil

    # Data about the alarm, in JSON format.
    @[JSON::Field(key: "HistoryData")]
    property history_data : String | Nil

    # A map of attributes that describe the alarm contributor associated with this history item,
    # providing context about the contributor's characteristics at the time of the event.
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

    def_equals_and_hash(@alarm_name, @alarm_contributor_id, @alarm_type, @timestamp, @history_item_type, @history_summary, @history_data, @alarm_contributor_attributes)
  end
end
