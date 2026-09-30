private alias Core = Amazonite::Core

module Amazonite::EC2
  class AuthorizeSecurityGroupIngressRequest
    # The IPv4 address range, in CIDR format.
    #
    # Amazon Web Services [canonicalizes](https://en.wikipedia.org/wiki/Canonicalization) IPv4 and
    # IPv6 CIDRs. For example, if you specify 100.68.0.18/18 for the CIDR block, Amazon Web Services
    # canonicalizes the CIDR block to 100.68.0.0/18. Any subsequent DescribeSecurityGroups and
    # DescribeSecurityGroupRules calls will return the canonicalized form of the CIDR block.
    # Additionally, if you attempt to add another rule with the non-canonical form of the CIDR (such
    # as 100.68.0.18/18) and there is already a rule for the canonicalized form of the CIDR block
    # (such as 100.68.0.0/18), the API throws an duplicate rule error.
    #
    # To specify an IPv6 address range, use IP permissions instead.
    #
    # To specify multiple rules and descriptions for the rules, use IP permissions instead.
    property cidr_ip : String | Nil

    # If the protocol is TCP or UDP, this is the start of the port range. If the protocol is ICMP,
    # this is the ICMP type or -1 (all ICMP types).
    #
    # To specify multiple rules and descriptions for the rules, use IP permissions instead.
    property from_port : Int32 | Nil

    # The ID of the security group.
    property group_id : String | Nil

    # [Default VPC] The name of the security group. For security groups for a default VPC you can
    # specify either the ID or the name of the security group. For security groups for a nondefault
    # VPC, you must specify the ID of the security group.
    property group_name : String | Nil

    # The permissions for the security group rules.
    property ip_permissions : Array(IpPermission) | Nil

    # The IP protocol name (`tcp`, `udp`, `icmp`) or number (see [Protocol
    # Numbers](http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml)). To specify
    # all protocols, use `-1`.
    #
    # To specify `icmpv6`, use IP permissions instead.
    #
    # If you specify a protocol other than one of the supported values, traffic is allowed on all
    # ports, regardless of any ports that you specify.
    #
    # To specify multiple rules and descriptions for the rules, use IP permissions instead.
    property ip_protocol : String | Nil

    # [Default VPC] The name of the source security group.
    #
    # The rule grants full ICMP, UDP, and TCP access. To create a rule with a specific protocol and
    # port range, specify a set of IP permissions instead.
    property source_security_group_name : String | Nil

    # The Amazon Web Services account ID for the source security group, if the source security group
    # is in a different account.
    #
    # The rule grants full ICMP, UDP, and TCP access. To create a rule with a specific protocol and
    # port range, use IP permissions instead.
    property source_security_group_owner_id : String | Nil

    # If the protocol is TCP or UDP, this is the end of the port range. If the protocol is ICMP, this
    # is the ICMP code or -1 (all ICMP codes). If the start port is -1 (all ICMP types), then the end
    # port must be -1 (all ICMP codes).
    #
    # To specify multiple rules and descriptions for the rules, use IP permissions instead.
    property to_port : Int32 | Nil

    # The tags applied to the security group rule.
    property tag_specifications : Array(TagSpecification) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @cidr_ip : String | Nil = nil,
      @from_port : Int32 | Nil = nil,
      @group_id : String | Nil = nil,
      @group_name : String | Nil = nil,
      @ip_permissions : Array(IpPermission) | Nil = nil,
      @ip_protocol : String | Nil = nil,
      @source_security_group_name : String | Nil = nil,
      @source_security_group_owner_id : String | Nil = nil,
      @to_port : Int32 | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @cidr_ip
        params << {"#{prefix}CidrIp", value}
      end

      if value = @from_port
        params << {"#{prefix}FromPort", value.to_s}
      end

      if value = @group_id
        params << {"#{prefix}GroupId", value}
      end

      if value = @group_name
        params << {"#{prefix}GroupName", value}
      end

      (@ip_permissions || [] of IpPermission).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}IpPermissions.#{i}."))
      end

      if value = @ip_protocol
        params << {"#{prefix}IpProtocol", value}
      end

      if value = @source_security_group_name
        params << {"#{prefix}SourceSecurityGroupName", value}
      end

      if value = @source_security_group_owner_id
        params << {"#{prefix}SourceSecurityGroupOwnerId", value}
      end

      if value = @to_port
        params << {"#{prefix}ToPort", value.to_s}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cidr_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='CidrIp']")),
        from_port: Core::XMLValue.i32(node.xpath_node("*[local-name()='FromPort']")),
        group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupId']")),
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupName']")),
        ip_permissions: node.xpath_nodes("*[local-name()='IpPermissions']/*[local-name()='item']").map { |n| IpPermission.from_xml(n) },
        ip_protocol: Core::XMLValue.string(node.xpath_node("*[local-name()='IpProtocol']")),
        source_security_group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceSecurityGroupName']")),
        source_security_group_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceSecurityGroupOwnerId']")),
        to_port: Core::XMLValue.i32(node.xpath_node("*[local-name()='ToPort']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
      if value = @ip_permissions
        value.each(&.validate!)
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@cidr_ip, @from_port, @group_id, @group_name, @ip_permissions, @ip_protocol, @source_security_group_name, @source_security_group_owner_id, @to_port, @tag_specifications, @dry_run)
  end
end
