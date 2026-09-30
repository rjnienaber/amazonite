private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamMeteredAccount
    IpamOwner
    ResourceOwner

    def self.to_json(e : IpamMeteredAccount, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamMeteredAccount::IpamOwner     then "ipam-owner"
              when AEC::IpamMeteredAccount::ResourceOwner then "resource-owner"
              else
                raise Exception.new("unknown enum value for 'IpamMeteredAccount' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamMeteredAccount
      value = pull.read_string
      case value
      when "ipam-owner"     then AEC::IpamMeteredAccount::IpamOwner
      when "resource-owner" then AEC::IpamMeteredAccount::ResourceOwner
      else
        raise Exception.new("unknown enum value for 'IpamMeteredAccount' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamMeteredAccount::IpamOwner     then "ipam-owner"
      when AEC::IpamMeteredAccount::ResourceOwner then "resource-owner"
      else
        raise Exception.new("unknown enum value for 'IpamMeteredAccount' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamMeteredAccount?
      case key
      when "ipam-owner"     then AEC::IpamMeteredAccount::IpamOwner
      when "resource-owner" then AEC::IpamMeteredAccount::ResourceOwner
      else
        nil
      end
    end
  end
end
