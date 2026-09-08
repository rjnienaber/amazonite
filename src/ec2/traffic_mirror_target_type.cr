private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TrafficMirrorTargetType
    NetworkInterface
    NetworkLoadBalancer
    GatewayLoadBalancerEndpoint

    def self.to_json(e : TrafficMirrorTargetType, json : JSON::Builder) : Nil
      value = case e
              when AEC::TrafficMirrorTargetType::NetworkInterface            then "network-interface"
              when AEC::TrafficMirrorTargetType::NetworkLoadBalancer         then "network-load-balancer"
              when AEC::TrafficMirrorTargetType::GatewayLoadBalancerEndpoint then "gateway-load-balancer-endpoint"
              else
                raise Exception.new("unknown enum value for 'TrafficMirrorTargetType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TrafficMirrorTargetType
      value = pull.read_string
      case value
      when "network-interface"              then AEC::TrafficMirrorTargetType::NetworkInterface
      when "network-load-balancer"          then AEC::TrafficMirrorTargetType::NetworkLoadBalancer
      when "gateway-load-balancer-endpoint" then AEC::TrafficMirrorTargetType::GatewayLoadBalancerEndpoint
      else
        raise Exception.new("unknown enum value for 'TrafficMirrorTargetType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TrafficMirrorTargetType::NetworkInterface            then "network-interface"
      when AEC::TrafficMirrorTargetType::NetworkLoadBalancer         then "network-load-balancer"
      when AEC::TrafficMirrorTargetType::GatewayLoadBalancerEndpoint then "gateway-load-balancer-endpoint"
      else
        raise Exception.new("unknown enum value for 'TrafficMirrorTargetType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TrafficMirrorTargetType?
      case key
      when "network-interface"              then AEC::TrafficMirrorTargetType::NetworkInterface
      when "network-load-balancer"          then AEC::TrafficMirrorTargetType::NetworkLoadBalancer
      when "gateway-load-balancer-endpoint" then AEC::TrafficMirrorTargetType::GatewayLoadBalancerEndpoint
      else
        nil
      end
    end
  end
end
