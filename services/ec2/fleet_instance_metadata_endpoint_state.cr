private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum FleetInstanceMetadataEndpointState
    Disabled
    Enabled

    def self.to_json(e : FleetInstanceMetadataEndpointState, json : JSON::Builder) : Nil
      value = case e
              when AEC::FleetInstanceMetadataEndpointState::Disabled then "disabled"
              when AEC::FleetInstanceMetadataEndpointState::Enabled  then "enabled"
              else
                raise Exception.new("unknown enum value for 'FleetInstanceMetadataEndpointState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FleetInstanceMetadataEndpointState
      value = pull.read_string
      case value
      when "disabled" then AEC::FleetInstanceMetadataEndpointState::Disabled
      when "enabled"  then AEC::FleetInstanceMetadataEndpointState::Enabled
      else
        raise Exception.new("unknown enum value for 'FleetInstanceMetadataEndpointState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FleetInstanceMetadataEndpointState::Disabled then "disabled"
      when AEC::FleetInstanceMetadataEndpointState::Enabled  then "enabled"
      else
        raise Exception.new("unknown enum value for 'FleetInstanceMetadataEndpointState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FleetInstanceMetadataEndpointState?
      case key
      when "disabled" then AEC::FleetInstanceMetadataEndpointState::Disabled
      when "enabled"  then AEC::FleetInstanceMetadataEndpointState::Enabled
      else
        nil
      end
    end
  end
end
