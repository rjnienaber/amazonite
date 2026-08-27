module Amazonite::SsmV1
  class TargetLocation
    include JSON::Serializable

    @[JSON::Field(key: "Accounts")]
    property accounts : Array(String) | Nil

    @[JSON::Field(key: "Regions")]
    property regions : Array(String) | Nil

    @[JSON::Field(key: "TargetLocationMaxConcurrency")]
    property target_location_max_concurrency : String | Nil

    @[JSON::Field(key: "TargetLocationMaxErrors")]
    property target_location_max_errors : String | Nil

    @[JSON::Field(key: "ExecutionRoleName")]
    property execution_role_name : String | Nil

    @[JSON::Field(key: "TargetLocationAlarmConfiguration")]
    property target_location_alarm_configuration : AlarmConfiguration | Nil

    def initialize(
      @accounts : Array(String) | Nil = nil,
      @regions : Array(String) | Nil = nil,
      @target_location_max_concurrency : String | Nil = nil,
      @target_location_max_errors : String | Nil = nil,
      @execution_role_name : String | Nil = nil,
      @target_location_alarm_configuration : AlarmConfiguration | Nil = nil,
    )
    end
  end
end
