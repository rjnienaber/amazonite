private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains the response to a successful
  # [ListEntitiesForPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListEntitiesForPolicy.html)
  # request.
  class ListEntitiesForPolicyResponse
    # A list of IAM groups that the policy is attached to.
    property policy_groups : Array(PolicyGroup) | Nil

    # A list of IAM users that the policy is attached to.
    property policy_users : Array(PolicyUser) | Nil

    # A list of IAM roles that the policy is attached to.
    property policy_roles : Array(PolicyRole) | Nil

    # A flag that indicates whether there are more items to return. If your results were truncated,
    # you can make a subsequent pagination request using the `Marker` request parameter to retrieve
    # more items. Note that IAM might return fewer than the `MaxItems` number of results even when
    # there are more results available. We recommend that you check `IsTruncated` after every call to
    # ensure that you receive all your results.
    property is_truncated : Bool | Nil

    # When `IsTruncated` is `true`, this element is present and contains the value to use for the
    # `Marker` parameter in a subsequent pagination request.
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

    def_equals_and_hash(@policy_groups, @policy_users, @policy_roles, @is_truncated, @marker)
  end
end
