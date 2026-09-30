private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum MonitoringState
    Disabled
    Disabling
    Enabled
    Pending

    def self.to_json(e : MonitoringState, json : JSON::Builder) : Nil
      value = case e
              when AEC::MonitoringState::Disabled  then "disabled"
              when AEC::MonitoringState::Disabling then "disabling"
              when AEC::MonitoringState::Enabled   then "enabled"
              when AEC::MonitoringState::Pending   then "pending"
              else
                raise Exception.new("unknown enum value for 'MonitoringState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::MonitoringState
      value = pull.read_string
      case value
      when "disabled"  then AEC::MonitoringState::Disabled
      when "disabling" then AEC::MonitoringState::Disabling
      when "enabled"   then AEC::MonitoringState::Enabled
      when "pending"   then AEC::MonitoringState::Pending
      else
        raise Exception.new("unknown enum value for 'MonitoringState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::MonitoringState::Disabled  then "disabled"
      when AEC::MonitoringState::Disabling then "disabling"
      when AEC::MonitoringState::Enabled   then "enabled"
      when AEC::MonitoringState::Pending   then "pending"
      else
        raise Exception.new("unknown enum value for 'MonitoringState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::MonitoringState?
      case key
      when "disabled"  then AEC::MonitoringState::Disabled
      when "disabling" then AEC::MonitoringState::Disabling
      when "enabled"   then AEC::MonitoringState::Enabled
      when "pending"   then AEC::MonitoringState::Pending
      else
        nil
      end
    end
  end
end
