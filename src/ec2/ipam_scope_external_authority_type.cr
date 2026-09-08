private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamScopeExternalAuthorityType
    Infoblox

    def self.to_json(e : IpamScopeExternalAuthorityType, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamScopeExternalAuthorityType::Infoblox then "infoblox"
              else
                raise Exception.new("unknown enum value for 'IpamScopeExternalAuthorityType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamScopeExternalAuthorityType
      value = pull.read_string
      case value
      when "infoblox" then AEC::IpamScopeExternalAuthorityType::Infoblox
      else
        raise Exception.new("unknown enum value for 'IpamScopeExternalAuthorityType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamScopeExternalAuthorityType::Infoblox then "infoblox"
      else
        raise Exception.new("unknown enum value for 'IpamScopeExternalAuthorityType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamScopeExternalAuthorityType?
      case key
      when "infoblox" then AEC::IpamScopeExternalAuthorityType::Infoblox
      else
        nil
      end
    end
  end
end
