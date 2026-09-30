private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamPublicAddressType
    ServiceManagedIp
    ServiceManagedByoip
    AmazonOwnedEip
    AmazonOwnedContig
    Byoip
    Ec2PublicIp
    AnycastIpListIp

    def self.to_json(e : IpamPublicAddressType, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamPublicAddressType::ServiceManagedIp    then "service-managed-ip"
              when AEC::IpamPublicAddressType::ServiceManagedByoip then "service-managed-byoip"
              when AEC::IpamPublicAddressType::AmazonOwnedEip      then "amazon-owned-eip"
              when AEC::IpamPublicAddressType::AmazonOwnedContig   then "amazon-owned-contig"
              when AEC::IpamPublicAddressType::Byoip               then "byoip"
              when AEC::IpamPublicAddressType::Ec2PublicIp         then "ec2-public-ip"
              when AEC::IpamPublicAddressType::AnycastIpListIp     then "anycast-ip-list-ip"
              else
                raise Exception.new("unknown enum value for 'IpamPublicAddressType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamPublicAddressType
      value = pull.read_string
      case value
      when "service-managed-ip"    then AEC::IpamPublicAddressType::ServiceManagedIp
      when "service-managed-byoip" then AEC::IpamPublicAddressType::ServiceManagedByoip
      when "amazon-owned-eip"      then AEC::IpamPublicAddressType::AmazonOwnedEip
      when "amazon-owned-contig"   then AEC::IpamPublicAddressType::AmazonOwnedContig
      when "byoip"                 then AEC::IpamPublicAddressType::Byoip
      when "ec2-public-ip"         then AEC::IpamPublicAddressType::Ec2PublicIp
      when "anycast-ip-list-ip"    then AEC::IpamPublicAddressType::AnycastIpListIp
      else
        raise Exception.new("unknown enum value for 'IpamPublicAddressType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamPublicAddressType::ServiceManagedIp    then "service-managed-ip"
      when AEC::IpamPublicAddressType::ServiceManagedByoip then "service-managed-byoip"
      when AEC::IpamPublicAddressType::AmazonOwnedEip      then "amazon-owned-eip"
      when AEC::IpamPublicAddressType::AmazonOwnedContig   then "amazon-owned-contig"
      when AEC::IpamPublicAddressType::Byoip               then "byoip"
      when AEC::IpamPublicAddressType::Ec2PublicIp         then "ec2-public-ip"
      when AEC::IpamPublicAddressType::AnycastIpListIp     then "anycast-ip-list-ip"
      else
        raise Exception.new("unknown enum value for 'IpamPublicAddressType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamPublicAddressType?
      case key
      when "service-managed-ip"    then AEC::IpamPublicAddressType::ServiceManagedIp
      when "service-managed-byoip" then AEC::IpamPublicAddressType::ServiceManagedByoip
      when "amazon-owned-eip"      then AEC::IpamPublicAddressType::AmazonOwnedEip
      when "amazon-owned-contig"   then AEC::IpamPublicAddressType::AmazonOwnedContig
      when "byoip"                 then AEC::IpamPublicAddressType::Byoip
      when "ec2-public-ip"         then AEC::IpamPublicAddressType::Ec2PublicIp
      when "anycast-ip-list-ip"    then AEC::IpamPublicAddressType::AnycastIpListIp
      else
        nil
      end
    end
  end
end
