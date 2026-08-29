module Amazonite::CloudWatchV1
  class PutCompositeAlarmInput
    include JSON::Serializable

    @[JSON::Field(key: "ActionsEnabled")]
    property actions_enabled : Bool | Nil

    @[JSON::Field(key: "AlarmActions")]
    property alarm_actions : Array(String) | Nil

    @[JSON::Field(key: "AlarmDescription")]
    property alarm_description : String | Nil

    @[JSON::Field(key: "AlarmName")]
    property alarm_name : String

    @[JSON::Field(key: "AlarmRule")]
    property alarm_rule : String

    @[JSON::Field(key: "InsufficientDataActions")]
    property insufficient_data_actions : Array(String) | Nil

    @[JSON::Field(key: "OKActions")]
    property ok_actions : Array(String) | Nil

    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    @[JSON::Field(key: "ActionsSuppressor")]
    property actions_suppressor : String | Nil

    @[JSON::Field(key: "ActionsSuppressorWaitPeriod")]
    property actions_suppressor_wait_period : Int32 | Nil

    @[JSON::Field(key: "ActionsSuppressorExtensionPeriod")]
    property actions_suppressor_extension_period : Int32 | Nil

    def initialize(
      @alarm_name : String,
      @alarm_rule : String,
      @actions_enabled : Bool | Nil = nil,
      @alarm_actions : Array(String) | Nil = nil,
      @alarm_description : String | Nil = nil,
      @insufficient_data_actions : Array(String) | Nil = nil,
      @ok_actions : Array(String) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @actions_suppressor : String | Nil = nil,
      @actions_suppressor_wait_period : Int32 | Nil = nil,
      @actions_suppressor_extension_period : Int32 | Nil = nil,
    )
    end
  end
end
