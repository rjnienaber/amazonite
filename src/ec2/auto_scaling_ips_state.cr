private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AutoScalingIpsState
    Enabled
    Disabled

    def self.to_json(e : AutoScalingIpsState, json : JSON::Builder) : Nil
      value = case e
              when AEC::AutoScalingIpsState::Enabled  then "enabled"
              when AEC::AutoScalingIpsState::Disabled then "disabled"
              else
                raise Exception.new("unknown enum value for 'AutoScalingIpsState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AutoScalingIpsState
      value = pull.read_string
      case value
      when "enabled"  then AEC::AutoScalingIpsState::Enabled
      when "disabled" then AEC::AutoScalingIpsState::Disabled
      else
        raise Exception.new("unknown enum value for 'AutoScalingIpsState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AutoScalingIpsState::Enabled  then "enabled"
      when AEC::AutoScalingIpsState::Disabled then "disabled"
      else
        raise Exception.new("unknown enum value for 'AutoScalingIpsState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AutoScalingIpsState?
      case key
      when "enabled"  then AEC::AutoScalingIpsState::Enabled
      when "disabled" then AEC::AutoScalingIpsState::Disabled
      else
        nil
      end
    end
  end
end
