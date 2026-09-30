private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ClientVpnDeviceTrustProviderType
    Crowdstrike
    Jamf
    Jumpcloud

    def self.to_json(e : ClientVpnDeviceTrustProviderType, json : JSON::Builder) : Nil
      value = case e
              when AEC::ClientVpnDeviceTrustProviderType::Crowdstrike then "crowdstrike"
              when AEC::ClientVpnDeviceTrustProviderType::Jamf        then "jamf"
              when AEC::ClientVpnDeviceTrustProviderType::Jumpcloud   then "jumpcloud"
              else
                raise Exception.new("unknown enum value for 'ClientVpnDeviceTrustProviderType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ClientVpnDeviceTrustProviderType
      value = pull.read_string
      case value
      when "crowdstrike" then AEC::ClientVpnDeviceTrustProviderType::Crowdstrike
      when "jamf"        then AEC::ClientVpnDeviceTrustProviderType::Jamf
      when "jumpcloud"   then AEC::ClientVpnDeviceTrustProviderType::Jumpcloud
      else
        raise Exception.new("unknown enum value for 'ClientVpnDeviceTrustProviderType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ClientVpnDeviceTrustProviderType::Crowdstrike then "crowdstrike"
      when AEC::ClientVpnDeviceTrustProviderType::Jamf        then "jamf"
      when AEC::ClientVpnDeviceTrustProviderType::Jumpcloud   then "jumpcloud"
      else
        raise Exception.new("unknown enum value for 'ClientVpnDeviceTrustProviderType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ClientVpnDeviceTrustProviderType?
      case key
      when "crowdstrike" then AEC::ClientVpnDeviceTrustProviderType::Crowdstrike
      when "jamf"        then AEC::ClientVpnDeviceTrustProviderType::Jamf
      when "jumpcloud"   then AEC::ClientVpnDeviceTrustProviderType::Jumpcloud
      else
        nil
      end
    end
  end
end
