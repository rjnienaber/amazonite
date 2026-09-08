private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VpcEndpointType
    Interface
    Gateway
    GatewayLoadBalancer
    Resource
    ServiceNetwork

    def self.to_json(e : VpcEndpointType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VpcEndpointType
      value = pull.read_string
      case value
      when "Interface"           then AEC::VpcEndpointType::Interface
      when "Gateway"             then AEC::VpcEndpointType::Gateway
      when "GatewayLoadBalancer" then AEC::VpcEndpointType::GatewayLoadBalancer
      when "Resource"            then AEC::VpcEndpointType::Resource
      when "ServiceNetwork"      then AEC::VpcEndpointType::ServiceNetwork
      else
        raise Exception.new("unknown enum value for 'VpcEndpointType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AEC::VpcEndpointType?
      case key
      when "Interface"           then AEC::VpcEndpointType::Interface
      when "Gateway"             then AEC::VpcEndpointType::Gateway
      when "GatewayLoadBalancer" then AEC::VpcEndpointType::GatewayLoadBalancer
      when "Resource"            then AEC::VpcEndpointType::Resource
      when "ServiceNetwork"      then AEC::VpcEndpointType::ServiceNetwork
      else
        nil
      end
    end
  end
end
