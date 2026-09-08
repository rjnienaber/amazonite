private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum InstanceMetadataEndpointState
    Disabled
    Enabled

    def self.to_json(e : InstanceMetadataEndpointState, json : JSON::Builder) : Nil
      value = case e
              when AEC::InstanceMetadataEndpointState::Disabled then "disabled"
              when AEC::InstanceMetadataEndpointState::Enabled  then "enabled"
              else
                raise Exception.new("unknown enum value for 'InstanceMetadataEndpointState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::InstanceMetadataEndpointState
      value = pull.read_string
      case value
      when "disabled" then AEC::InstanceMetadataEndpointState::Disabled
      when "enabled"  then AEC::InstanceMetadataEndpointState::Enabled
      else
        raise Exception.new("unknown enum value for 'InstanceMetadataEndpointState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::InstanceMetadataEndpointState::Disabled then "disabled"
      when AEC::InstanceMetadataEndpointState::Enabled  then "enabled"
      else
        raise Exception.new("unknown enum value for 'InstanceMetadataEndpointState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::InstanceMetadataEndpointState?
      case key
      when "disabled" then AEC::InstanceMetadataEndpointState::Disabled
      when "enabled"  then AEC::InstanceMetadataEndpointState::Enabled
      else
        nil
      end
    end
  end
end
