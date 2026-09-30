private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamPoolAllocationResourceType
    IpamPool
    Vpc
    Ec2PublicIpv4Pool
    Custom
    Subnet
    Eip
    AnycastIpList

    def self.to_json(e : IpamPoolAllocationResourceType, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamPoolAllocationResourceType::IpamPool          then "ipam-pool"
              when AEC::IpamPoolAllocationResourceType::Vpc               then "vpc"
              when AEC::IpamPoolAllocationResourceType::Ec2PublicIpv4Pool then "ec2-public-ipv4-pool"
              when AEC::IpamPoolAllocationResourceType::Custom            then "custom"
              when AEC::IpamPoolAllocationResourceType::Subnet            then "subnet"
              when AEC::IpamPoolAllocationResourceType::Eip               then "eip"
              when AEC::IpamPoolAllocationResourceType::AnycastIpList     then "anycast-ip-list"
              else
                raise Exception.new("unknown enum value for 'IpamPoolAllocationResourceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamPoolAllocationResourceType
      value = pull.read_string
      case value
      when "ipam-pool"            then AEC::IpamPoolAllocationResourceType::IpamPool
      when "vpc"                  then AEC::IpamPoolAllocationResourceType::Vpc
      when "ec2-public-ipv4-pool" then AEC::IpamPoolAllocationResourceType::Ec2PublicIpv4Pool
      when "custom"               then AEC::IpamPoolAllocationResourceType::Custom
      when "subnet"               then AEC::IpamPoolAllocationResourceType::Subnet
      when "eip"                  then AEC::IpamPoolAllocationResourceType::Eip
      when "anycast-ip-list"      then AEC::IpamPoolAllocationResourceType::AnycastIpList
      else
        raise Exception.new("unknown enum value for 'IpamPoolAllocationResourceType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamPoolAllocationResourceType::IpamPool          then "ipam-pool"
      when AEC::IpamPoolAllocationResourceType::Vpc               then "vpc"
      when AEC::IpamPoolAllocationResourceType::Ec2PublicIpv4Pool then "ec2-public-ipv4-pool"
      when AEC::IpamPoolAllocationResourceType::Custom            then "custom"
      when AEC::IpamPoolAllocationResourceType::Subnet            then "subnet"
      when AEC::IpamPoolAllocationResourceType::Eip               then "eip"
      when AEC::IpamPoolAllocationResourceType::AnycastIpList     then "anycast-ip-list"
      else
        raise Exception.new("unknown enum value for 'IpamPoolAllocationResourceType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamPoolAllocationResourceType?
      case key
      when "ipam-pool"            then AEC::IpamPoolAllocationResourceType::IpamPool
      when "vpc"                  then AEC::IpamPoolAllocationResourceType::Vpc
      when "ec2-public-ipv4-pool" then AEC::IpamPoolAllocationResourceType::Ec2PublicIpv4Pool
      when "custom"               then AEC::IpamPoolAllocationResourceType::Custom
      when "subnet"               then AEC::IpamPoolAllocationResourceType::Subnet
      when "eip"                  then AEC::IpamPoolAllocationResourceType::Eip
      when "anycast-ip-list"      then AEC::IpamPoolAllocationResourceType::AnycastIpList
      else
        nil
      end
    end
  end
end
