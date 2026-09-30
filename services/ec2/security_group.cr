private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a security group.
  class SecurityGroup
    # The ID of the security group.
    property group_id : String | Nil

    # The outbound rules associated with the security group.
    property ip_permissions_egress : Array(IpPermission) | Nil

    # Any tags assigned to the security group.
    property tags : Array(Tag) | Nil

    # The ID of the VPC for the security group.
    property vpc_id : String | Nil

    # The ARN of the security group.
    property security_group_arn : String | Nil

    # The Amazon Web Services account ID of the owner of the security group.
    property owner_id : String | Nil

    # The name of the security group.
    property group_name : String | Nil

    # A description of the security group.
    property description : String | Nil

    # The inbound rules associated with the security group.
    property ip_permissions : Array(IpPermission) | Nil

    def initialize(
      @group_id : String | Nil = nil,
      @ip_permissions_egress : Array(IpPermission) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @vpc_id : String | Nil = nil,
      @security_group_arn : String | Nil = nil,
      @owner_id : String | Nil = nil,
      @group_name : String | Nil = nil,
      @description : String | Nil = nil,
      @ip_permissions : Array(IpPermission) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @group_id
        params << {"#{prefix}GroupId", value}
      end

      (@ip_permissions_egress || [] of IpPermission).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}IpPermissionsEgress.#{i}."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @security_group_arn
        params << {"#{prefix}SecurityGroupArn", value}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @group_name
        params << {"#{prefix}GroupName", value}
      end

      if value = @description
        params << {"#{prefix}GroupDescription", value}
      end

      (@ip_permissions || [] of IpPermission).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}IpPermissions.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='groupId']")),
        ip_permissions_egress: node.xpath_nodes("*[local-name()='ipPermissionsEgress']/*[local-name()='item']").map { |n| IpPermission.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
        security_group_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='securityGroupArn']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='groupName']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='groupDescription']")),
        ip_permissions: node.xpath_nodes("*[local-name()='ipPermissions']/*[local-name()='item']").map { |n| IpPermission.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ip_permissions_egress
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end

      if value = @ip_permissions
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@group_id, @ip_permissions_egress, @tags, @vpc_id, @security_group_arn, @owner_id, @group_name, @description, @ip_permissions)
  end
end
