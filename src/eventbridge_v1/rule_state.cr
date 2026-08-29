private alias AEB = Amazonite::EventBridgeV1

module Amazonite::EventBridgeV1
  enum RuleState
    Enabled
    Disabled
    EnabledWithAllCloudtrailManagementEvents

    def self.to_json(e : RuleState, json : JSON::Builder) : Nil
      value = case e
              when AEB::RuleState::Enabled                                  then "ENABLED"
              when AEB::RuleState::Disabled                                 then "DISABLED"
              when AEB::RuleState::EnabledWithAllCloudtrailManagementEvents then "ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS"
              else
                raise Exception.new("unknown enum value for 'RuleState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEB::RuleState
      value = pull.read_string
      case value
      when "ENABLED"                                       then AEB::RuleState::Enabled
      when "DISABLED"                                      then AEB::RuleState::Disabled
      when "ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS" then AEB::RuleState::EnabledWithAllCloudtrailManagementEvents
      else
        raise Exception.new("unknown enum value for 'RuleState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEB::RuleState::Enabled                                  then "ENABLED"
      when AEB::RuleState::Disabled                                 then "DISABLED"
      when AEB::RuleState::EnabledWithAllCloudtrailManagementEvents then "ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS"
      else
        raise Exception.new("unknown enum value for 'RuleState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEB::RuleState?
      case key
      when "ENABLED"                                       then AEB::RuleState::Enabled
      when "DISABLED"                                      then AEB::RuleState::Disabled
      when "ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS" then AEB::RuleState::EnabledWithAllCloudtrailManagementEvents
      else
        nil
      end
    end
  end
end
