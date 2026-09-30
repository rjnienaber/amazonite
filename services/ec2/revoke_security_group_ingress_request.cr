private alias Core = Amazonite::Core

module Amazonite::EC2
  class RevokeSecurityGroupIngressRequest
    # The CIDR IP address range. You can't specify this parameter when specifying a source security
    # group.
    property cidr_ip : String | Nil

    # If the protocol is TCP or UDP, this is the start of the port range. If the protocol is ICMP,
    # this is the ICMP type or -1 (all ICMP types).
    property from_port : Int32 | Nil

    # The ID of the security group.
    property group_id : String | Nil

    # [Default VPC] The name of the security group. You must specify either the security group ID or
    # the security group name in the request. For security groups in a nondefault VPC, you must
    # specify the security group ID.
    property group_name : String | Nil

    # The sets of IP permissions. You can't specify a source security group and a CIDR IP address
    # range in the same set of permissions.
    property ip_permissions : Array(IpPermission) | Nil

    # The IP protocol name (`tcp`, `udp`, `icmp`) or number (see [Protocol
    # Numbers](http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml)). Use `-1` to
    # specify all.
    property ip_protocol : String | Nil

    # [Default VPC] The name of the source security group. You can't specify this parameter in
    # combination with the following parameters: the CIDR IP address range, the start of the port
    # range, the IP protocol, and the end of the port range. The source security group must be in the
    # same VPC. To revoke a specific rule for an IP protocol and port range, use a set of IP
    # permissions instead.
    property source_security_group_name : String | Nil

    # Not supported.
    property source_security_group_owner_id : String | Nil

    # If the protocol is TCP or UDP, this is the end of the port range. If the protocol is ICMP, this
    # is the ICMP code or -1 (all ICMP codes).
    property to_port : Int32 | Nil

    # The IDs of the security group rules.
    property security_group_rule_ids : Array(String) | Nil

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
      @security_group_rule_ids : Array(String) | Nil = nil,
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

      (@security_group_rule_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SecurityGroupRuleId.#{i}", item}
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
        security_group_rule_ids: node.xpath_nodes("*[local-name()='SecurityGroupRuleId']/*[local-name()='item']").map { |n| n.content },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
      if value = @ip_permissions
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@cidr_ip, @from_port, @group_id, @group_name, @ip_permissions, @ip_protocol, @source_security_group_name, @source_security_group_owner_id, @to_port, @security_group_rule_ids, @dry_run)
  end
end
