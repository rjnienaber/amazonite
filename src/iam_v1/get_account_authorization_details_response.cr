private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetAccountAuthorizationDetailsResponse
    property user_detail_list : Array(UserDetail) | Nil

    property group_detail_list : Array(GroupDetail) | Nil

    property role_detail_list : Array(RoleDetail) | Nil

    property policies : Array(ManagedPolicyDetail) | Nil

    property is_truncated : Bool | Nil

    property marker : String | Nil

    def initialize(
      @user_detail_list : Array(UserDetail) | Nil = nil,
      @group_detail_list : Array(GroupDetail) | Nil = nil,
      @role_detail_list : Array(RoleDetail) | Nil = nil,
      @policies : Array(ManagedPolicyDetail) | Nil = nil,
      @is_truncated : Bool | Nil = nil,
      @marker : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@user_detail_list || [] of UserDetail).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}UserDetailList.member.#{i}."))
      end

      (@group_detail_list || [] of GroupDetail).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}GroupDetailList.member.#{i}."))
      end

      (@role_detail_list || [] of RoleDetail).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RoleDetailList.member.#{i}."))
      end

      (@policies || [] of ManagedPolicyDetail).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Policies.member.#{i}."))
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
        user_detail_list: node.xpath_nodes("*[local-name()='UserDetailList']/*[local-name()='member']").map { |n| UserDetail.from_xml(n) },
        group_detail_list: node.xpath_nodes("*[local-name()='GroupDetailList']/*[local-name()='member']").map { |n| GroupDetail.from_xml(n) },
        role_detail_list: node.xpath_nodes("*[local-name()='RoleDetailList']/*[local-name()='member']").map { |n| RoleDetail.from_xml(n) },
        policies: node.xpath_nodes("*[local-name()='Policies']/*[local-name()='member']").map { |n| ManagedPolicyDetail.from_xml(n) },
        is_truncated: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsTruncated']")),
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
      )
    end
  end
end
