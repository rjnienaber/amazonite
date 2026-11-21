private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum NetworkFirewallConnectivityType
    Flexible
    OutboundOnly
    Bidirectional
    Exclude
    AzUnsupported

    def self.to_json(e : NetworkFirewallConnectivityType, json : JSON::Builder) : Nil
      value = case e
              when AEC::NetworkFirewallConnectivityType::Flexible      then "flexible"
              when AEC::NetworkFirewallConnectivityType::OutboundOnly  then "outbound-only"
              when AEC::NetworkFirewallConnectivityType::Bidirectional then "bidirectional"
              when AEC::NetworkFirewallConnectivityType::Exclude       then "exclude"
              when AEC::NetworkFirewallConnectivityType::AzUnsupported then "az-unsupported"
              else
                raise Exception.new("unknown enum value for 'NetworkFirewallConnectivityType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::NetworkFirewallConnectivityType
      value = pull.read_string
      case value
      when "flexible"       then AEC::NetworkFirewallConnectivityType::Flexible
      when "outbound-only"  then AEC::NetworkFirewallConnectivityType::OutboundOnly
      when "bidirectional"  then AEC::NetworkFirewallConnectivityType::Bidirectional
      when "exclude"        then AEC::NetworkFirewallConnectivityType::Exclude
      when "az-unsupported" then AEC::NetworkFirewallConnectivityType::AzUnsupported
      else
        raise Exception.new("unknown enum value for 'NetworkFirewallConnectivityType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::NetworkFirewallConnectivityType::Flexible      then "flexible"
      when AEC::NetworkFirewallConnectivityType::OutboundOnly  then "outbound-only"
      when AEC::NetworkFirewallConnectivityType::Bidirectional then "bidirectional"
      when AEC::NetworkFirewallConnectivityType::Exclude       then "exclude"
      when AEC::NetworkFirewallConnectivityType::AzUnsupported then "az-unsupported"
      else
        raise Exception.new("unknown enum value for 'NetworkFirewallConnectivityType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::NetworkFirewallConnectivityType?
      case key
      when "flexible"       then AEC::NetworkFirewallConnectivityType::Flexible
      when "outbound-only"  then AEC::NetworkFirewallConnectivityType::OutboundOnly
      when "bidirectional"  then AEC::NetworkFirewallConnectivityType::Bidirectional
      when "exclude"        then AEC::NetworkFirewallConnectivityType::Exclude
      when "az-unsupported" then AEC::NetworkFirewallConnectivityType::AzUnsupported
      else
        nil
      end
    end
  end
end
