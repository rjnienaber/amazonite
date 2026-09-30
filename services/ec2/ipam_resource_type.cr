private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamResourceType
    Vpc
    Subnet
    Eip
    PublicIpv4Pool
    Ipv6Pool
    Eni
    AnycastIpList

    def self.to_json(e : IpamResourceType, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamResourceType::Vpc            then "vpc"
              when AEC::IpamResourceType::Subnet         then "subnet"
              when AEC::IpamResourceType::Eip            then "eip"
              when AEC::IpamResourceType::PublicIpv4Pool then "public-ipv4-pool"
              when AEC::IpamResourceType::Ipv6Pool       then "ipv6-pool"
              when AEC::IpamResourceType::Eni            then "eni"
              when AEC::IpamResourceType::AnycastIpList  then "anycast-ip-list"
              else
                raise Exception.new("unknown enum value for 'IpamResourceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamResourceType
      value = pull.read_string
      case value
      when "vpc"              then AEC::IpamResourceType::Vpc
      when "subnet"           then AEC::IpamResourceType::Subnet
      when "eip"              then AEC::IpamResourceType::Eip
      when "public-ipv4-pool" then AEC::IpamResourceType::PublicIpv4Pool
      when "ipv6-pool"        then AEC::IpamResourceType::Ipv6Pool
      when "eni"              then AEC::IpamResourceType::Eni
      when "anycast-ip-list"  then AEC::IpamResourceType::AnycastIpList
      else
        raise Exception.new("unknown enum value for 'IpamResourceType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamResourceType::Vpc            then "vpc"
      when AEC::IpamResourceType::Subnet         then "subnet"
      when AEC::IpamResourceType::Eip            then "eip"
      when AEC::IpamResourceType::PublicIpv4Pool then "public-ipv4-pool"
      when AEC::IpamResourceType::Ipv6Pool       then "ipv6-pool"
      when AEC::IpamResourceType::Eni            then "eni"
      when AEC::IpamResourceType::AnycastIpList  then "anycast-ip-list"
      else
        raise Exception.new("unknown enum value for 'IpamResourceType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamResourceType?
      case key
      when "vpc"              then AEC::IpamResourceType::Vpc
      when "subnet"           then AEC::IpamResourceType::Subnet
      when "eip"              then AEC::IpamResourceType::Eip
      when "public-ipv4-pool" then AEC::IpamResourceType::PublicIpv4Pool
      when "ipv6-pool"        then AEC::IpamResourceType::Ipv6Pool
      when "eni"              then AEC::IpamResourceType::Eni
      when "anycast-ip-list"  then AEC::IpamResourceType::AnycastIpList
      else
        nil
      end
    end
  end
end
