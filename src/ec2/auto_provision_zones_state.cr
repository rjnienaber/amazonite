private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AutoProvisionZonesState
    Enabled
    Disabled

    def self.to_json(e : AutoProvisionZonesState, json : JSON::Builder) : Nil
      value = case e
              when AEC::AutoProvisionZonesState::Enabled  then "enabled"
              when AEC::AutoProvisionZonesState::Disabled then "disabled"
              else
                raise Exception.new("unknown enum value for 'AutoProvisionZonesState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AutoProvisionZonesState
      value = pull.read_string
      case value
      when "enabled"  then AEC::AutoProvisionZonesState::Enabled
      when "disabled" then AEC::AutoProvisionZonesState::Disabled
      else
        raise Exception.new("unknown enum value for 'AutoProvisionZonesState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AutoProvisionZonesState::Enabled  then "enabled"
      when AEC::AutoProvisionZonesState::Disabled then "disabled"
      else
        raise Exception.new("unknown enum value for 'AutoProvisionZonesState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AutoProvisionZonesState?
      case key
      when "enabled"  then AEC::AutoProvisionZonesState::Enabled
      when "disabled" then AEC::AutoProvisionZonesState::Disabled
      else
        nil
      end
    end
  end
end
