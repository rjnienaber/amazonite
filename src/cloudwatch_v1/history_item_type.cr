private alias ACW = Amazonite::CloudWatchV1

module Amazonite::CloudWatchV1
  enum HistoryItemType
    ConfigurationUpdate
    StateUpdate
    Action
    AlarmContributorStateUpdate
    AlarmContributorAction

    def self.to_json(e : HistoryItemType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ACW::HistoryItemType
      value = pull.read_string
      case value
      when "ConfigurationUpdate"         then ACW::HistoryItemType::ConfigurationUpdate
      when "StateUpdate"                 then ACW::HistoryItemType::StateUpdate
      when "Action"                      then ACW::HistoryItemType::Action
      when "AlarmContributorStateUpdate" then ACW::HistoryItemType::AlarmContributorStateUpdate
      when "AlarmContributorAction"      then ACW::HistoryItemType::AlarmContributorAction
      else
        raise Exception.new("unknown enum value for 'HistoryItemType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : ACW::HistoryItemType?
      case key
      when "ConfigurationUpdate"         then ACW::HistoryItemType::ConfigurationUpdate
      when "StateUpdate"                 then ACW::HistoryItemType::StateUpdate
      when "Action"                      then ACW::HistoryItemType::Action
      when "AlarmContributorStateUpdate" then ACW::HistoryItemType::AlarmContributorStateUpdate
      when "AlarmContributorAction"      then ACW::HistoryItemType::AlarmContributorAction
      else
        nil
      end
    end
  end
end
