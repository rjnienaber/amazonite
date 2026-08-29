private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ListEntitiesForPolicyResponse
    property policy_groups : Array(PolicyGroup) | Nil

    property policy_users : Array(PolicyUser) | Nil

    property policy_roles : Array(PolicyRole) | Nil

    property is_truncated : Bool | Nil

    property marker : String | Nil

    def initialize(
      @policy_groups : Array(PolicyGroup) | Nil = nil,
      @policy_users : Array(PolicyUser) | Nil = nil,
      @policy_roles : Array(PolicyRole) | Nil = nil,
      @is_truncated : Bool | Nil = nil,
      @marker : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@policy_groups || [] of PolicyGroup).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PolicyGroups.member.#{i}."))
      end

      (@policy_users || [] of PolicyUser).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PolicyUsers.member.#{i}."))
      end

      (@policy_roles || [] of PolicyRole).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PolicyRoles.member.#{i}."))
      end

      if value = @is_truncated
        params << {"#{prefix}IsTruncated", Core::QueryValue.bool(value)}
      end

      if value = @marker
        params << {"#{prefix}Marker", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_groups: node.xpath_nodes("*[local-name()='PolicyGroups']/*[local-name()='member']").map { |n| PolicyGroup.from_xml(n) },
        policy_users: node.xpath_nodes("*[local-name()='PolicyUsers']/*[local-name()='member']").map { |n| PolicyUser.from_xml(n) },
        policy_roles: node.xpath_nodes("*[local-name()='PolicyRoles']/*[local-name()='member']").map { |n| PolicyRole.from_xml(n) },
        is_truncated: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsTruncated']")),
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
      )
    end
  end
end
