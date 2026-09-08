private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum LaunchTemplateAutoRecoveryState
    Default
    Disabled

    def self.to_json(e : LaunchTemplateAutoRecoveryState, json : JSON::Builder) : Nil
      value = case e
              when AEC::LaunchTemplateAutoRecoveryState::Default  then "default"
              when AEC::LaunchTemplateAutoRecoveryState::Disabled then "disabled"
              else
                raise Exception.new("unknown enum value for 'LaunchTemplateAutoRecoveryState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::LaunchTemplateAutoRecoveryState
      value = pull.read_string
      case value
      when "default"  then AEC::LaunchTemplateAutoRecoveryState::Default
      when "disabled" then AEC::LaunchTemplateAutoRecoveryState::Disabled
      else
        raise Exception.new("unknown enum value for 'LaunchTemplateAutoRecoveryState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::LaunchTemplateAutoRecoveryState::Default  then "default"
      when AEC::LaunchTemplateAutoRecoveryState::Disabled then "disabled"
      else
        raise Exception.new("unknown enum value for 'LaunchTemplateAutoRecoveryState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::LaunchTemplateAutoRecoveryState?
      case key
      when "default"  then AEC::LaunchTemplateAutoRecoveryState::Default
      when "disabled" then AEC::LaunchTemplateAutoRecoveryState::Disabled
      else
        nil
      end
    end
  end
end
