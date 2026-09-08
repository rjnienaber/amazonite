private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TrafficIpAddressType
    Ipv4
    Ipv6
    DualStack

    def self.to_json(e : TrafficIpAddressType, json : JSON::Builder) : Nil
      value = case e
              when AEC::TrafficIpAddressType::Ipv4      then "ipv4"
              when AEC::TrafficIpAddressType::Ipv6      then "ipv6"
              when AEC::TrafficIpAddressType::DualStack then "dual-stack"
              else
                raise Exception.new("unknown enum value for 'TrafficIpAddressType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TrafficIpAddressType
      value = pull.read_string
      case value
      when "ipv4"       then AEC::TrafficIpAddressType::Ipv4
      when "ipv6"       then AEC::TrafficIpAddressType::Ipv6
      when "dual-stack" then AEC::TrafficIpAddressType::DualStack
      else
        raise Exception.new("unknown enum value for 'TrafficIpAddressType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TrafficIpAddressType::Ipv4      then "ipv4"
      when AEC::TrafficIpAddressType::Ipv6      then "ipv6"
      when AEC::TrafficIpAddressType::DualStack then "dual-stack"
      else
        raise Exception.new("unknown enum value for 'TrafficIpAddressType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TrafficIpAddressType?
      case key
      when "ipv4"       then AEC::TrafficIpAddressType::Ipv4
      when "ipv6"       then AEC::TrafficIpAddressType::Ipv6
      when "dual-stack" then AEC::TrafficIpAddressType::DualStack
      else
        nil
      end
    end
  end
end
