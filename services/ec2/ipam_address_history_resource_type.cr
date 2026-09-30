private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamAddressHistoryResourceType
    Eip
    Vpc
    Subnet
    NetworkInterface
    Instance

    def self.to_json(e : IpamAddressHistoryResourceType, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamAddressHistoryResourceType::Eip              then "eip"
              when AEC::IpamAddressHistoryResourceType::Vpc              then "vpc"
              when AEC::IpamAddressHistoryResourceType::Subnet           then "subnet"
              when AEC::IpamAddressHistoryResourceType::NetworkInterface then "network-interface"
              when AEC::IpamAddressHistoryResourceType::Instance         then "instance"
              else
                raise Exception.new("unknown enum value for 'IpamAddressHistoryResourceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamAddressHistoryResourceType
      value = pull.read_string
      case value
      when "eip"               then AEC::IpamAddressHistoryResourceType::Eip
      when "vpc"               then AEC::IpamAddressHistoryResourceType::Vpc
      when "subnet"            then AEC::IpamAddressHistoryResourceType::Subnet
      when "network-interface" then AEC::IpamAddressHistoryResourceType::NetworkInterface
      when "instance"          then AEC::IpamAddressHistoryResourceType::Instance
      else
        raise Exception.new("unknown enum value for 'IpamAddressHistoryResourceType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamAddressHistoryResourceType::Eip              then "eip"
      when AEC::IpamAddressHistoryResourceType::Vpc              then "vpc"
      when AEC::IpamAddressHistoryResourceType::Subnet           then "subnet"
      when AEC::IpamAddressHistoryResourceType::NetworkInterface then "network-interface"
      when AEC::IpamAddressHistoryResourceType::Instance         then "instance"
      else
        raise Exception.new("unknown enum value for 'IpamAddressHistoryResourceType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamAddressHistoryResourceType?
      case key
      when "eip"               then AEC::IpamAddressHistoryResourceType::Eip
      when "vpc"               then AEC::IpamAddressHistoryResourceType::Vpc
      when "subnet"            then AEC::IpamAddressHistoryResourceType::Subnet
      when "network-interface" then AEC::IpamAddressHistoryResourceType::NetworkInterface
      when "instance"          then AEC::IpamAddressHistoryResourceType::Instance
      else
        nil
      end
    end
  end
end
