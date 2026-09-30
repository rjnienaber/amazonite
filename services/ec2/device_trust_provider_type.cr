private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum DeviceTrustProviderType
    Jamf
    Crowdstrike
    Jumpcloud

    def self.to_json(e : DeviceTrustProviderType, json : JSON::Builder) : Nil
      value = case e
              when AEC::DeviceTrustProviderType::Jamf        then "jamf"
              when AEC::DeviceTrustProviderType::Crowdstrike then "crowdstrike"
              when AEC::DeviceTrustProviderType::Jumpcloud   then "jumpcloud"
              else
                raise Exception.new("unknown enum value for 'DeviceTrustProviderType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::DeviceTrustProviderType
      value = pull.read_string
      case value
      when "jamf"        then AEC::DeviceTrustProviderType::Jamf
      when "crowdstrike" then AEC::DeviceTrustProviderType::Crowdstrike
      when "jumpcloud"   then AEC::DeviceTrustProviderType::Jumpcloud
      else
        raise Exception.new("unknown enum value for 'DeviceTrustProviderType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::DeviceTrustProviderType::Jamf        then "jamf"
      when AEC::DeviceTrustProviderType::Crowdstrike then "crowdstrike"
      when AEC::DeviceTrustProviderType::Jumpcloud   then "jumpcloud"
      else
        raise Exception.new("unknown enum value for 'DeviceTrustProviderType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::DeviceTrustProviderType?
      case key
      when "jamf"        then AEC::DeviceTrustProviderType::Jamf
      when "crowdstrike" then AEC::DeviceTrustProviderType::Crowdstrike
      when "jumpcloud"   then AEC::DeviceTrustProviderType::Jumpcloud
      else
        nil
      end
    end
  end
end
