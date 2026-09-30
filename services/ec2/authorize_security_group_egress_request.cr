private alias Core = Amazonite::Core

module Amazonite::EC2
  class AuthorizeSecurityGroupEgressRequest
    # The tags applied to the security group rule.
    property tag_specifications : Array(TagSpecification) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the security group.
    property group_id : String

    # Not supported. Use IP permissions instead.
    property source_security_group_name : String | Nil

    # Not supported. Use IP permissions instead.
    property source_security_group_owner_id : String | Nil

    # Not supported. Use IP permissions instead.
    property ip_protocol : String | Nil

    # Not supported. Use IP permissions instead.
    property from_port : Int32 | Nil

    # Not supported. Use IP permissions instead.
    property to_port : Int32 | Nil

    # Not supported. Use IP permissions instead.
    property cidr_ip : String | Nil

    # The permissions for the security group rules.
    property ip_permissions : Array(IpPermission) | Nil

    def initialize(
      @group_id : String,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
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

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
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
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
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
      if value = @tag_specifications
        value.each(&.validate!)
      end

      if value = @ip_permissions
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@tag_specifications, @dry_run, @group_id, @source_security_group_name, @source_security_group_owner_id, @ip_protocol, @from_port, @to_port, @cidr_ip, @ip_permissions)
  end
end
