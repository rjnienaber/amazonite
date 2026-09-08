private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ServiceType
    Interface
    Gateway
    GatewayLoadBalancer

    def self.to_json(e : ServiceType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ServiceType
      value = pull.read_string
      case value
      when "Interface"           then AEC::ServiceType::Interface
      when "Gateway"             then AEC::ServiceType::Gateway
      when "GatewayLoadBalancer" then AEC::ServiceType::GatewayLoadBalancer
      else
        raise Exception.new("unknown enum value for 'ServiceType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AEC::ServiceType?
      case key
      when "Interface"           then AEC::ServiceType::Interface
      when "Gateway"             then AEC::ServiceType::Gateway
      when "GatewayLoadBalancer" then AEC::ServiceType::GatewayLoadBalancer
      else
        nil
      end
    end
  end
end
