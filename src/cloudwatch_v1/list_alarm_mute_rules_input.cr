private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class ListAlarmMuteRulesInput
    include JSON::Serializable

    @[JSON::Field(key: "AlarmName")]
    property alarm_name : String | Nil

    @[JSON::Field(key: "Statuses", converter: Core::ArrayConverter(ACW::AlarmMuteRuleStatus))]
    property statuses : Array(AlarmMuteRuleStatus) | Nil

    @[JSON::Field(key: "MaxRecords")]
    property max_records : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @alarm_name : String | Nil = nil,
      @statuses : Array(AlarmMuteRuleStatus) | Nil = nil,
      @max_records : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
