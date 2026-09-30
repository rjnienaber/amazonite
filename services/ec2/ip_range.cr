private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an IPv4 address range.
  class IpRange
    # A description for the security group rule that references this IPv4 address range.
    #
    # Constraints: Up to 255 characters in length. Allowed characters are a-z, A-Z, 0-9, spaces, and
    # ._-:/()#,@[]+=\&;{}!$*
    property description : String | Nil

    # The IPv4 address range. You can either specify a CIDR block or a source security group, not
    # both. To specify a single IPv4 address, use the /32 prefix length.
    #
    # Amazon Web Services [canonicalizes](https://en.wikipedia.org/wiki/Canonicalization) IPv4 and
    # IPv6 CIDRs. For example, if you specify 100.68.0.18/18 for the CIDR block, Amazon Web Services
    # canonicalizes the CIDR block to 100.68.0.0/18. Any subsequent DescribeSecurityGroups and
    # DescribeSecurityGroupRules calls will return the canonicalized form of the CIDR block.
    # Additionally, if you attempt to add another rule with the non-canonical form of the CIDR (such
    # as 100.68.0.18/18) and there is already a rule for the canonicalized form of the CIDR block
    # (such as 100.68.0.0/18), the API throws an duplicate rule error.
    property cidr_ip : String | Nil

    def initialize(
      @description : String | Nil = nil,
      @cidr_ip : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @cidr_ip
        params << {"#{prefix}CidrIp", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        cidr_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='cidrIp']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@description, @cidr_ip)
  end
end
