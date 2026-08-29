private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class PutAlarmMuteRuleInput
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "Rule")]
    property rule : Rule

    @[JSON::Field(key: "MuteTargets")]
    property mute_targets : MuteTargets | Nil

    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    @[JSON::Field(key: "StartDate", converter: Core::AWSEpochConverter)]
    property start_date : Time | Nil

    @[JSON::Field(key: "ExpireDate", converter: Core::AWSEpochConverter)]
    property expire_date : Time | Nil

    def initialize(
      @name : String,
      @rule : Rule,
      @description : String | Nil = nil,
      @mute_targets : MuteTargets | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @start_date : Time | Nil = nil,
      @expire_date : Time | Nil = nil,
    )
    end
  end
end
