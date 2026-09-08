private alias Core = Amazonite::Core

module Amazonite::EC2
  class UpdateSecurityGroupRuleDescriptionsEgressRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the security group. You must specify either the security group ID or the security
    # group name in the request. For security groups in a nondefault VPC, you must specify the
    # security group ID.
    property group_id : String | Nil

    # [Default VPC] The name of the security group. You must specify either the security group ID or
    # the security group name.
    property group_name : String | Nil

    # The IP permissions for the security group rule. You must specify either the IP permissions or
    # the description.
    property ip_permissions : Array(IpPermission) | Nil

    # The description for the egress security group rules. You must specify either the description or
    # the IP permissions.
    property security_group_rule_descriptions : Array(SecurityGroupRuleDescription) | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @group_id : String | Nil = nil,
      @group_name : String | Nil = nil,
      @ip_permissions : Array(IpPermission) | Nil = nil,
      @security_group_rule_descriptions : Array(SecurityGroupRuleDescription) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
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

      (@security_group_rule_descriptions || [] of SecurityGroupRuleDescription).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SecurityGroupRuleDescription.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupId']")),
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupName']")),
        ip_permissions: node.xpath_nodes("*[local-name()='IpPermissions']/*[local-name()='item']").map { |n| IpPermission.from_xml(n) },
        security_group_rule_descriptions: node.xpath_nodes("*[local-name()='SecurityGroupRuleDescription']/*[local-name()='item']").map { |n| SecurityGroupRuleDescription.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ip_permissions
        value.each(&.validate!)
      end

      if value = @security_group_rule_descriptions
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @group_id, @group_name, @ip_permissions, @security_group_rule_descriptions)
  end
end
