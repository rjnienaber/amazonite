private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum DefaultInstanceMetadataEndpointState
    Disabled
    Enabled
    NoPreference

    def self.to_json(e : DefaultInstanceMetadataEndpointState, json : JSON::Builder) : Nil
      value = case e
              when AEC::DefaultInstanceMetadataEndpointState::Disabled     then "disabled"
              when AEC::DefaultInstanceMetadataEndpointState::Enabled      then "enabled"
              when AEC::DefaultInstanceMetadataEndpointState::NoPreference then "no-preference"
              else
                raise Exception.new("unknown enum value for 'DefaultInstanceMetadataEndpointState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::DefaultInstanceMetadataEndpointState
      value = pull.read_string
      case value
      when "disabled"      then AEC::DefaultInstanceMetadataEndpointState::Disabled
      when "enabled"       then AEC::DefaultInstanceMetadataEndpointState::Enabled
      when "no-preference" then AEC::DefaultInstanceMetadataEndpointState::NoPreference
      else
        raise Exception.new("unknown enum value for 'DefaultInstanceMetadataEndpointState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::DefaultInstanceMetadataEndpointState::Disabled     then "disabled"
      when AEC::DefaultInstanceMetadataEndpointState::Enabled      then "enabled"
      when AEC::DefaultInstanceMetadataEndpointState::NoPreference then "no-preference"
      else
        raise Exception.new("unknown enum value for 'DefaultInstanceMetadataEndpointState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::DefaultInstanceMetadataEndpointState?
      case key
      when "disabled"      then AEC::DefaultInstanceMetadataEndpointState::Disabled
      when "enabled"       then AEC::DefaultInstanceMetadataEndpointState::Enabled
      when "no-preference" then AEC::DefaultInstanceMetadataEndpointState::NoPreference
      else
        nil
      end
    end
  end
end
