private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum LaunchTemplateInstanceMetadataProtocolIpv6
    Disabled
    Enabled

    def self.to_json(e : LaunchTemplateInstanceMetadataProtocolIpv6, json : JSON::Builder) : Nil
      value = case e
              when AEC::LaunchTemplateInstanceMetadataProtocolIpv6::Disabled then "disabled"
              when AEC::LaunchTemplateInstanceMetadataProtocolIpv6::Enabled  then "enabled"
              else
                raise Exception.new("unknown enum value for 'LaunchTemplateInstanceMetadataProtocolIpv6' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::LaunchTemplateInstanceMetadataProtocolIpv6
      value = pull.read_string
      case value
      when "disabled" then AEC::LaunchTemplateInstanceMetadataProtocolIpv6::Disabled
      when "enabled"  then AEC::LaunchTemplateInstanceMetadataProtocolIpv6::Enabled
      else
        raise Exception.new("unknown enum value for 'LaunchTemplateInstanceMetadataProtocolIpv6' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::LaunchTemplateInstanceMetadataProtocolIpv6::Disabled then "disabled"
      when AEC::LaunchTemplateInstanceMetadataProtocolIpv6::Enabled  then "enabled"
      else
        raise Exception.new("unknown enum value for 'LaunchTemplateInstanceMetadataProtocolIpv6' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::LaunchTemplateInstanceMetadataProtocolIpv6?
      case key
      when "disabled" then AEC::LaunchTemplateInstanceMetadataProtocolIpv6::Disabled
      when "enabled"  then AEC::LaunchTemplateInstanceMetadataProtocolIpv6::Enabled
      else
        nil
      end
    end
  end
end
