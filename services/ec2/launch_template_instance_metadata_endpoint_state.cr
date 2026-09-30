private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum LaunchTemplateInstanceMetadataEndpointState
    Disabled
    Enabled

    def self.to_json(e : LaunchTemplateInstanceMetadataEndpointState, json : JSON::Builder) : Nil
      value = case e
              when AEC::LaunchTemplateInstanceMetadataEndpointState::Disabled then "disabled"
              when AEC::LaunchTemplateInstanceMetadataEndpointState::Enabled  then "enabled"
              else
                raise Exception.new("unknown enum value for 'LaunchTemplateInstanceMetadataEndpointState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::LaunchTemplateInstanceMetadataEndpointState
      value = pull.read_string
      case value
      when "disabled" then AEC::LaunchTemplateInstanceMetadataEndpointState::Disabled
      when "enabled"  then AEC::LaunchTemplateInstanceMetadataEndpointState::Enabled
      else
        raise Exception.new("unknown enum value for 'LaunchTemplateInstanceMetadataEndpointState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::LaunchTemplateInstanceMetadataEndpointState::Disabled then "disabled"
      when AEC::LaunchTemplateInstanceMetadataEndpointState::Enabled  then "enabled"
      else
        raise Exception.new("unknown enum value for 'LaunchTemplateInstanceMetadataEndpointState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::LaunchTemplateInstanceMetadataEndpointState?
      case key
      when "disabled" then AEC::LaunchTemplateInstanceMetadataEndpointState::Disabled
      when "enabled"  then AEC::LaunchTemplateInstanceMetadataEndpointState::Enabled
      else
        nil
      end
    end
  end
end
