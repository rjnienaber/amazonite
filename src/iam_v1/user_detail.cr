private alias Core = Amazonite::Core

module Amazonite::IamV1
  class UserDetail
    property path : String | Nil

    property user_name : String | Nil

    property user_id : String | Nil

    property arn : String | Nil

    property create_date : Time | Nil

    property user_policy_list : Array(PolicyDetail) | Nil

    property group_list : Array(String) | Nil

    property attached_managed_policies : Array(AttachedPolicy) | Nil

    property permissions_boundary : AttachedPermissionsBoundary | Nil

    property tags : Array(Tag) | Nil

    def initialize(
      @path : String | Nil = nil,
      @user_name : String | Nil = nil,
      @user_id : String | Nil = nil,
      @arn : String | Nil = nil,
      @create_date : Time | Nil = nil,
      @user_policy_list : Array(PolicyDetail) | Nil = nil,
      @group_list : Array(String) | Nil = nil,
      @attached_managed_policies : Array(AttachedPolicy) | Nil = nil,
      @permissions_boundary : AttachedPermissionsBoundary | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @path
        params << {"#{prefix}Path", value}
      end

      if value = @user_name
        params << {"#{prefix}UserName", value}
      end

      if value = @user_id
        params << {"#{prefix}UserId", value}
      end

      if value = @arn
        params << {"#{prefix}Arn", value}
      end

      if value = @create_date
        params << {"#{prefix}CreateDate", Core::QueryValue.time(value)}
      end

      (@user_policy_list || [] of PolicyDetail).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}UserPolicyList.member.#{i}."))
      end

      (@group_list || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}GroupList.member.#{i}", item}
      end

      (@attached_managed_policies || [] of AttachedPolicy).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AttachedManagedPolicies.member.#{i}."))
      end

      if value = @permissions_boundary
        params.concat(value.to_query_params("#{prefix}PermissionsBoundary."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")),
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")),
        user_id: Core::XMLValue.string(node.xpath_node("*[local-name()='UserId']")),
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")),
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")),
        user_policy_list: node.xpath_nodes("*[local-name()='UserPolicyList']/*[local-name()='member']").map { |n| PolicyDetail.from_xml(n) },
        group_list: node.xpath_nodes("*[local-name()='GroupList']/*[local-name()='member']").map { |n| n.content },
        attached_managed_policies: node.xpath_nodes("*[local-name()='AttachedManagedPolicies']/*[local-name()='member']").map { |n| AttachedPolicy.from_xml(n) },
        permissions_boundary: node.xpath_node("*[local-name()='PermissionsBoundary']").try { |n| AttachedPermissionsBoundary.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end
  end
end
