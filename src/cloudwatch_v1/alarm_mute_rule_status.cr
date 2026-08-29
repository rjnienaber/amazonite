private alias ACW = Amazonite::CloudWatchV1

module Amazonite::CloudWatchV1
  enum AlarmMuteRuleStatus
    Scheduled
    Active
    Expired

    def self.to_json(e : AlarmMuteRuleStatus, json : JSON::Builder) : Nil
      value = case e
              when ACW::AlarmMuteRuleStatus::Scheduled then "SCHEDULED"
              when ACW::AlarmMuteRuleStatus::Active    then "ACTIVE"
              when ACW::AlarmMuteRuleStatus::Expired   then "EXPIRED"
              else
                raise Exception.new("unknown enum value for 'AlarmMuteRuleStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACW::AlarmMuteRuleStatus
      value = pull.read_string
      case value
      when "SCHEDULED" then ACW::AlarmMuteRuleStatus::Scheduled
      when "ACTIVE"    then ACW::AlarmMuteRuleStatus::Active
      when "EXPIRED"   then ACW::AlarmMuteRuleStatus::Expired
      else
        raise Exception.new("unknown enum value for 'AlarmMuteRuleStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACW::AlarmMuteRuleStatus::Scheduled then "SCHEDULED"
      when ACW::AlarmMuteRuleStatus::Active    then "ACTIVE"
      when ACW::AlarmMuteRuleStatus::Expired   then "EXPIRED"
      else
        raise Exception.new("unknown enum value for 'AlarmMuteRuleStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACW::AlarmMuteRuleStatus?
      case key
      when "SCHEDULED" then ACW::AlarmMuteRuleStatus::Scheduled
      when "ACTIVE"    then ACW::AlarmMuteRuleStatus::Active
      when "EXPIRED"   then ACW::AlarmMuteRuleStatus::Expired
      else
        nil
      end
    end
  end
end
