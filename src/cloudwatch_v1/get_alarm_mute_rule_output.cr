private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class GetAlarmMuteRuleOutput
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "AlarmMuteRuleArn")]
    property alarm_mute_rule_arn : String | Nil

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "Rule")]
    property rule : Rule | Nil

    @[JSON::Field(key: "MuteTargets")]
    property mute_targets : MuteTargets | Nil

    @[JSON::Field(key: "StartDate", converter: Core::AWSEpochConverter)]
    property start_date : Time | Nil

    @[JSON::Field(key: "ExpireDate", converter: Core::AWSEpochConverter)]
    property expire_date : Time | Nil

    @[JSON::Field(key: "Status", converter: ACW::AlarmMuteRuleStatus)]
    property status : AlarmMuteRuleStatus | Nil

    @[JSON::Field(key: "LastUpdatedTimestamp", converter: Core::AWSEpochConverter)]
    property last_updated_timestamp : Time | Nil

    @[JSON::Field(key: "MuteType")]
    property mute_type : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @alarm_mute_rule_arn : String | Nil = nil,
      @description : String | Nil = nil,
      @rule : Rule | Nil = nil,
      @mute_targets : MuteTargets | Nil = nil,
      @start_date : Time | Nil = nil,
      @expire_date : Time | Nil = nil,
      @status : AlarmMuteRuleStatus | Nil = nil,
      @last_updated_timestamp : Time | Nil = nil,
      @mute_type : String | Nil = nil,
    )
    end
  end
end
