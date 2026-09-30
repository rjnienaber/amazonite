private alias Core = Amazonite::Core

module Amazonite::EC2
  class RevokeSecurityGroupEgressRequest
    # The IDs of the security group rules.
    property security_group_rule_ids : Array(String) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the security group.
    property group_id : String

    # Not supported. Use a set of IP permissions to specify a destination security group.
    property source_security_group_name : String | Nil

    # Not supported. Use a set of IP permissions to specify a destination security group.
    property source_security_group_owner_id : String | Nil

    # Not supported. Use a set of IP permissions to specify the protocol name or number.
    property ip_protocol : String | Nil

    # Not supported. Use a set of IP permissions to specify the port.
    property from_port : Int32 | Nil

    # Not supported. Use a set of IP permissions to specify the port.
    property to_port : Int32 | Nil

    # Not supported. Use a set of IP permissions to specify the CIDR.
    property cidr_ip : String | Nil

    # The sets of IP permissions. You can't specify a destination security group and a CIDR IP address
    # range in the same set of permissions.
    property ip_permissions : Array(IpPermission) | Nil

    def initialize(
      @group_id : String,
      @security_group_rule_ids : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @source_security_group_name : String | Nil = nil,
      @source_security_group_owner_id : String | Nil = nil,
      @ip_protocol : String | Nil = nil,
      @from_port : Int32 | Nil = nil,
      @to_port : Int32 | Nil = nil,
      @cidr_ip : String | Nil = nil,
      @ip_permissions : Array(IpPermission) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@security_group_rule_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SecurityGroupRuleId.#{i}", item}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}GroupId", @group_id}

      if value = @source_security_group_name
        params << {"#{prefix}SourceSecurityGroupName", value}
      end

      if value = @source_security_group_owner_id
        params << {"#{prefix}SourceSecurityGroupOwnerId", value}
      end

      if value = @ip_protocol
        params << {"#{prefix}IpProtocol", value}
      end

      if value = @from_port
        params << {"#{prefix}FromPort", value.to_s}
      end

      if value = @to_port
        params << {"#{prefix}ToPort", value.to_s}
      end

      if value = @cidr_ip
        params << {"#{prefix}CidrIp", value}
      end

      (@ip_permissions || [] of IpPermission).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}IpPermissions.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        security_group_rule_ids: node.xpath_nodes("*[local-name()='SecurityGroupRuleId']/*[local-name()='item']").map { |n| n.content },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='groupId']")).not_nil!,
        source_security_group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='sourceSecurityGroupName']")),
        source_security_group_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='sourceSecurityGroupOwnerId']")),
        ip_protocol: Core::XMLValue.string(node.xpath_node("*[local-name()='ipProtocol']")),
        from_port: Core::XMLValue.i32(node.xpath_node("*[local-name()='fromPort']")),
        to_port: Core::XMLValue.i32(node.xpath_node("*[local-name()='toPort']")),
        cidr_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='cidrIp']")),
        ip_permissions: node.xpath_nodes("*[local-name()='ipPermissions']/*[local-name()='item']").map { |n| IpPermission.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ip_permissions
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@security_group_rule_ids, @dry_run, @group_id, @source_security_group_name, @source_security_group_owner_id, @ip_protocol, @from_port, @to_port, @cidr_ip, @ip_permissions)
  end
end
