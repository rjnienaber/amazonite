private alias AAG = Amazonite::ApiGatewayV1

module Amazonite::ApiGatewayV1
  enum IpAddressType
    Ipv4
    Dualstack

    def self.to_json(e : IpAddressType, json : JSON::Builder) : Nil
      value = case e
              when AAG::IpAddressType::Ipv4      then "ipv4"
              when AAG::IpAddressType::Dualstack then "dualstack"
              else
                raise Exception.new("unknown enum value for 'IpAddressType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AAG::IpAddressType
      value = pull.read_string
      case value
      when "ipv4"      then AAG::IpAddressType::Ipv4
      when "dualstack" then AAG::IpAddressType::Dualstack
      else
        raise Exception.new("unknown enum value for 'IpAddressType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AAG::IpAddressType::Ipv4      then "ipv4"
      when AAG::IpAddressType::Dualstack then "dualstack"
      else
        raise Exception.new("unknown enum value for 'IpAddressType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AAG::IpAddressType?
      case key
      when "ipv4"      then AAG::IpAddressType::Ipv4
      when "dualstack" then AAG::IpAddressType::Dualstack
      else
        nil
      end
    end
  end
end
