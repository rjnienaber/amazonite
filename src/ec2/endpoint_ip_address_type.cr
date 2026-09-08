private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum EndpointIpAddressType
    Ipv4
    Ipv6
    DualStack

    def self.to_json(e : EndpointIpAddressType, json : JSON::Builder) : Nil
      value = case e
              when AEC::EndpointIpAddressType::Ipv4      then "ipv4"
              when AEC::EndpointIpAddressType::Ipv6      then "ipv6"
              when AEC::EndpointIpAddressType::DualStack then "dual-stack"
              else
                raise Exception.new("unknown enum value for 'EndpointIpAddressType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::EndpointIpAddressType
      value = pull.read_string
      case value
      when "ipv4"       then AEC::EndpointIpAddressType::Ipv4
      when "ipv6"       then AEC::EndpointIpAddressType::Ipv6
      when "dual-stack" then AEC::EndpointIpAddressType::DualStack
      else
        raise Exception.new("unknown enum value for 'EndpointIpAddressType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::EndpointIpAddressType::Ipv4      then "ipv4"
      when AEC::EndpointIpAddressType::Ipv6      then "ipv6"
      when AEC::EndpointIpAddressType::DualStack then "dual-stack"
      else
        raise Exception.new("unknown enum value for 'EndpointIpAddressType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::EndpointIpAddressType?
      case key
      when "ipv4"       then AEC::EndpointIpAddressType::Ipv4
      when "ipv6"       then AEC::EndpointIpAddressType::Ipv6
      when "dual-stack" then AEC::EndpointIpAddressType::DualStack
      else
        nil
      end
    end
  end
end
