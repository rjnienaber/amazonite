private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class DescribeAlarmHistoryInput
    include JSON::Serializable

    @[JSON::Field(key: "AlarmName")]
    property alarm_name : String | Nil

    @[JSON::Field(key: "AlarmContributorId")]
    property alarm_contributor_id : String | Nil

    @[JSON::Field(key: "AlarmTypes", converter: Core::ArrayConverter(ACW::AlarmType))]
    property alarm_types : Array(AlarmType) | Nil

    @[JSON::Field(key: "HistoryItemType", converter: ACW::HistoryItemType)]
    property history_item_type : HistoryItemType | Nil

    @[JSON::Field(key: "StartDate", converter: Core::AWSEpochConverter)]
    property start_date : Time | Nil

    @[JSON::Field(key: "EndDate", converter: Core::AWSEpochConverter)]
    property end_date : Time | Nil

    @[JSON::Field(key: "MaxRecords")]
    property max_records : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "ScanBy", converter: ACW::ScanBy)]
    property scan_by : ScanBy | Nil

    def initialize(
      @alarm_name : String | Nil = nil,
      @alarm_contributor_id : String | Nil = nil,
      @alarm_types : Array(AlarmType) | Nil = nil,
      @history_item_type : HistoryItemType | Nil = nil,
      @start_date : Time | Nil = nil,
      @end_date : Time | Nil = nil,
      @max_records : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @scan_by : ScanBy | Nil = nil,
    )
    end
  end
end
