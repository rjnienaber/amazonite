private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum InstanceMetadataProtocolState
    Disabled
    Enabled

    def self.to_json(e : InstanceMetadataProtocolState, json : JSON::Builder) : Nil
      value = case e
              when AEC::InstanceMetadataProtocolState::Disabled then "disabled"
              when AEC::InstanceMetadataProtocolState::Enabled  then "enabled"
              else
                raise Exception.new("unknown enum value for 'InstanceMetadataProtocolState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::InstanceMetadataProtocolState
      value = pull.read_string
      case value
      when "disabled" then AEC::InstanceMetadataProtocolState::Disabled
      when "enabled"  then AEC::InstanceMetadataProtocolState::Enabled
      else
        raise Exception.new("unknown enum value for 'InstanceMetadataProtocolState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::InstanceMetadataProtocolState::Disabled then "disabled"
      when AEC::InstanceMetadataProtocolState::Enabled  then "enabled"
      else
        raise Exception.new("unknown enum value for 'InstanceMetadataProtocolState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::InstanceMetadataProtocolState?
      case key
      when "disabled" then AEC::InstanceMetadataProtocolState::Disabled
      when "enabled"  then AEC::InstanceMetadataProtocolState::Enabled
      else
        nil
      end
    end
  end
end
