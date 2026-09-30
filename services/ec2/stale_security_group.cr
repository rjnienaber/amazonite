private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a stale security group (a security group that contains stale rules).
  class StaleSecurityGroup
    # The description of the security group.
    property description : String | Nil

    # The ID of the security group.
    property group_id : String | Nil

    # The name of the security group.
    property group_name : String | Nil

    # Information about the stale inbound rules in the security group.
    property stale_ip_permissions : Array(StaleIpPermission) | Nil

    # Information about the stale outbound rules in the security group.
    property stale_ip_permissions_egress : Array(StaleIpPermission) | Nil

    # The ID of the VPC for the security group.
    property vpc_id : String | Nil

    def initialize(
      @description : String | Nil = nil,
      @group_id : String | Nil = nil,
      @group_name : String | Nil = nil,
      @stale_ip_permissions : Array(StaleIpPermission) | Nil = nil,
      @stale_ip_permissions_egress : Array(StaleIpPermission) | Nil = nil,
      @vpc_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @group_id
        params << {"#{prefix}GroupId", value}
      end

      if value = @group_name
        params << {"#{prefix}GroupName", value}
      end

      (@stale_ip_permissions || [] of StaleIpPermission).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}StaleIpPermissions.#{i}."))
      end

      (@stale_ip_permissions_egress || [] of StaleIpPermission).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}StaleIpPermissionsEgress.#{i}."))
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='groupId']")),
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='groupName']")),
        stale_ip_permissions: node.xpath_nodes("*[local-name()='staleIpPermissions']/*[local-name()='item']").map { |n| StaleIpPermission.from_xml(n) },
        stale_ip_permissions_egress: node.xpath_nodes("*[local-name()='staleIpPermissionsEgress']/*[local-name()='item']").map { |n| StaleIpPermission.from_xml(n) },
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
      )
    end

    def validate! : Nil
      if value = @stale_ip_permissions
        value.each(&.validate!)
      end

      if value = @stale_ip_permissions_egress
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@description, @group_id, @group_name, @stale_ip_permissions, @stale_ip_permissions_egress, @vpc_id)
  end
end
