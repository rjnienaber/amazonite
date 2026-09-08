private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum HostnameType
    IpName
    ResourceName

    def self.to_json(e : HostnameType, json : JSON::Builder) : Nil
      value = case e
              when AEC::HostnameType::IpName       then "ip-name"
              when AEC::HostnameType::ResourceName then "resource-name"
              else
                raise Exception.new("unknown enum value for 'HostnameType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::HostnameType
      value = pull.read_string
      case value
      when "ip-name"       then AEC::HostnameType::IpName
      when "resource-name" then AEC::HostnameType::ResourceName
      else
        raise Exception.new("unknown enum value for 'HostnameType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::HostnameType::IpName       then "ip-name"
      when AEC::HostnameType::ResourceName then "resource-name"
      else
        raise Exception.new("unknown enum value for 'HostnameType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::HostnameType?
      case key
      when "ip-name"       then AEC::HostnameType::IpName
      when "resource-name" then AEC::HostnameType::ResourceName
      else
        nil
      end
    end
  end
end
