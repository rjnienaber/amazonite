private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TrustProviderType
    User
    Device

    def self.to_json(e : TrustProviderType, json : JSON::Builder) : Nil
      value = case e
              when AEC::TrustProviderType::User   then "user"
              when AEC::TrustProviderType::Device then "device"
              else
                raise Exception.new("unknown enum value for 'TrustProviderType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TrustProviderType
      value = pull.read_string
      case value
      when "user"   then AEC::TrustProviderType::User
      when "device" then AEC::TrustProviderType::Device
      else
        raise Exception.new("unknown enum value for 'TrustProviderType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TrustProviderType::User   then "user"
      when AEC::TrustProviderType::Device then "device"
      else
        raise Exception.new("unknown enum value for 'TrustProviderType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TrustProviderType?
      case key
      when "user"   then AEC::TrustProviderType::User
      when "device" then AEC::TrustProviderType::Device
      else
        nil
      end
    end
  end
end
