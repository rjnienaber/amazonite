private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum InstanceAutoRecoveryState
    Disabled
    Default

    def self.to_json(e : InstanceAutoRecoveryState, json : JSON::Builder) : Nil
      value = case e
              when AEC::InstanceAutoRecoveryState::Disabled then "disabled"
              when AEC::InstanceAutoRecoveryState::Default  then "default"
              else
                raise Exception.new("unknown enum value for 'InstanceAutoRecoveryState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::InstanceAutoRecoveryState
      value = pull.read_string
      case value
      when "disabled" then AEC::InstanceAutoRecoveryState::Disabled
      when "default"  then AEC::InstanceAutoRecoveryState::Default
      else
        raise Exception.new("unknown enum value for 'InstanceAutoRecoveryState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::InstanceAutoRecoveryState::Disabled then "disabled"
      when AEC::InstanceAutoRecoveryState::Default  then "default"
      else
        raise Exception.new("unknown enum value for 'InstanceAutoRecoveryState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::InstanceAutoRecoveryState?
      case key
      when "disabled" then AEC::InstanceAutoRecoveryState::Disabled
      when "default"  then AEC::InstanceAutoRecoveryState::Default
      else
        nil
      end
    end
  end
end
