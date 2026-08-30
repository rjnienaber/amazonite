private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class DescribeAlarmHistoryInput
    include JSON::Serializable

    # The name of the alarm.
    @[JSON::Field(key: "AlarmName")]
    property alarm_name : String | Nil

    # The unique identifier of a specific alarm contributor to filter the alarm history results.
    @[JSON::Field(key: "AlarmContributorId")]
    property alarm_contributor_id : String | Nil

    # Use this parameter to specify whether you want the operation to return metric alarms, composite
    # alarms, or log alarms. If you omit this parameter, only metric alarms are returned.
    @[JSON::Field(key: "AlarmTypes", converter: Core::ArrayConverter(ACW::AlarmType))]
    property alarm_types : Array(AlarmType) | Nil

    # The type of alarm histories to retrieve.
    @[JSON::Field(key: "HistoryItemType", converter: ACW::HistoryItemType)]
    property history_item_type : HistoryItemType | Nil

    # The starting date to retrieve alarm history.
    @[JSON::Field(key: "StartDate", converter: Core::AWSEpochConverter)]
    property start_date : Time | Nil

    # The ending date to retrieve alarm history.
    @[JSON::Field(key: "EndDate", converter: Core::AWSEpochConverter)]
    property end_date : Time | Nil

    # The maximum number of alarm history records to retrieve.
    @[JSON::Field(key: "MaxRecords")]
    property max_records : Int32 | Nil

    # The token returned by a previous call to indicate that there is more data available.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # Specified whether to return the newest or oldest alarm history first. Specify
    # `TimestampDescending` to have the newest event history returned first, and specify
    # `TimestampAscending` to have the oldest history returned first.
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

    def validate! : Nil
      if value = @alarm_name
        raise Core::ValidationError.new("AlarmName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AlarmName length must be <= 255") if value.size > 255
      end

      if value = @alarm_contributor_id
        raise Core::ValidationError.new("AlarmContributorId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AlarmContributorId length must be <= 16") if value.size > 16
      end

      if value = @max_records
        raise Core::ValidationError.new("MaxRecords value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxRecords value must be <= 100") if value > 100
      end
    end

    def_equals_and_hash(@alarm_name, @alarm_contributor_id, @alarm_types, @history_item_type, @start_date, @end_date, @max_records, @next_token, @scan_by)
  end
end
