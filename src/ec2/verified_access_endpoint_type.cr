private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VerifiedAccessEndpointType
    LoadBalancer
    NetworkInterface
    Rds
    Cidr

    def self.to_json(e : VerifiedAccessEndpointType, json : JSON::Builder) : Nil
      value = case e
              when AEC::VerifiedAccessEndpointType::LoadBalancer     then "load-balancer"
              when AEC::VerifiedAccessEndpointType::NetworkInterface then "network-interface"
              when AEC::VerifiedAccessEndpointType::Rds              then "rds"
              when AEC::VerifiedAccessEndpointType::Cidr             then "cidr"
              else
                raise Exception.new("unknown enum value for 'VerifiedAccessEndpointType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VerifiedAccessEndpointType
      value = pull.read_string
      case value
      when "load-balancer"     then AEC::VerifiedAccessEndpointType::LoadBalancer
      when "network-interface" then AEC::VerifiedAccessEndpointType::NetworkInterface
      when "rds"               then AEC::VerifiedAccessEndpointType::Rds
      when "cidr"              then AEC::VerifiedAccessEndpointType::Cidr
      else
        raise Exception.new("unknown enum value for 'VerifiedAccessEndpointType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VerifiedAccessEndpointType::LoadBalancer     then "load-balancer"
      when AEC::VerifiedAccessEndpointType::NetworkInterface then "network-interface"
      when AEC::VerifiedAccessEndpointType::Rds              then "rds"
      when AEC::VerifiedAccessEndpointType::Cidr             then "cidr"
      else
        raise Exception.new("unknown enum value for 'VerifiedAccessEndpointType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VerifiedAccessEndpointType?
      case key
      when "load-balancer"     then AEC::VerifiedAccessEndpointType::LoadBalancer
      when "network-interface" then AEC::VerifiedAccessEndpointType::NetworkInterface
      when "rds"               then AEC::VerifiedAccessEndpointType::Rds
      when "cidr"              then AEC::VerifiedAccessEndpointType::Cidr
      else
        nil
      end
    end
  end
end
