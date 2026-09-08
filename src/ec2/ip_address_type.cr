private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpAddressType
    Ipv4
    Dualstack
    Ipv6

    def self.to_json(e : IpAddressType, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpAddressType::Ipv4      then "ipv4"
              when AEC::IpAddressType::Dualstack then "dualstack"
              when AEC::IpAddressType::Ipv6      then "ipv6"
              else
                raise Exception.new("unknown enum value for 'IpAddressType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpAddressType
      value = pull.read_string
      case value
      when "ipv4"      then AEC::IpAddressType::Ipv4
      when "dualstack" then AEC::IpAddressType::Dualstack
      when "ipv6"      then AEC::IpAddressType::Ipv6
      else
        raise Exception.new("unknown enum value for 'IpAddressType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpAddressType::Ipv4      then "ipv4"
      when AEC::IpAddressType::Dualstack then "dualstack"
      when AEC::IpAddressType::Ipv6      then "ipv6"
      else
        raise Exception.new("unknown enum value for 'IpAddressType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpAddressType?
      case key
      when "ipv4"      then AEC::IpAddressType::Ipv4
      when "dualstack" then AEC::IpAddressType::Dualstack
      when "ipv6"      then AEC::IpAddressType::Ipv6
      else
        nil
      end
    end
  end
end
