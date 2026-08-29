private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class DescribeAlarmsInput
    include JSON::Serializable

    @[JSON::Field(key: "AlarmNames")]
    property alarm_names : Array(String) | Nil

    @[JSON::Field(key: "AlarmNamePrefix")]
    property alarm_name_prefix : String | Nil

    @[JSON::Field(key: "AlarmTypes", converter: Core::ArrayConverter(ACW::AlarmType))]
    property alarm_types : Array(AlarmType) | Nil

    @[JSON::Field(key: "ChildrenOfAlarmName")]
    property children_of_alarm_name : String | Nil

    @[JSON::Field(key: "ParentsOfAlarmName")]
    property parents_of_alarm_name : String | Nil

    @[JSON::Field(key: "StateValue", converter: ACW::StateValue)]
    property state_value : StateValue | Nil

    @[JSON::Field(key: "ActionPrefix")]
    property action_prefix : String | Nil

    @[JSON::Field(key: "MaxRecords")]
    property max_records : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @alarm_names : Array(String) | Nil = nil,
      @alarm_name_prefix : String | Nil = nil,
      @alarm_types : Array(AlarmType) | Nil = nil,
      @children_of_alarm_name : String | Nil = nil,
      @parents_of_alarm_name : String | Nil = nil,
      @state_value : StateValue | Nil = nil,
      @action_prefix : String | Nil = nil,
      @max_records : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
