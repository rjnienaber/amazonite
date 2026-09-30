private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum NatGatewayApplianceType
    NetworkFirewallProxy

    def self.to_json(e : NatGatewayApplianceType, json : JSON::Builder) : Nil
      value = case e
              when AEC::NatGatewayApplianceType::NetworkFirewallProxy then "network-firewall-proxy"
              else
                raise Exception.new("unknown enum value for 'NatGatewayApplianceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::NatGatewayApplianceType
      value = pull.read_string
      case value
      when "network-firewall-proxy" then AEC::NatGatewayApplianceType::NetworkFirewallProxy
      else
        raise Exception.new("unknown enum value for 'NatGatewayApplianceType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::NatGatewayApplianceType::NetworkFirewallProxy then "network-firewall-proxy"
      else
        raise Exception.new("unknown enum value for 'NatGatewayApplianceType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::NatGatewayApplianceType?
      case key
      when "network-firewall-proxy" then AEC::NatGatewayApplianceType::NetworkFirewallProxy
      else
        nil
      end
    end
  end
end
