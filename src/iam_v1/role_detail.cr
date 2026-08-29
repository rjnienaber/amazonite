private alias Core = Amazonite::Core

module Amazonite::IamV1
  class RoleDetail
    property path : String | Nil

    property role_name : String | Nil

    property role_id : String | Nil

    property arn : String | Nil

    property create_date : Time | Nil

    property assume_role_policy_document : String | Nil

    property instance_profile_list : Array(InstanceProfile) | Nil

    property role_policy_list : Array(PolicyDetail) | Nil

    property attached_managed_policies : Array(AttachedPolicy) | Nil

    property permissions_boundary : AttachedPermissionsBoundary | Nil

    property tags : Array(Tag) | Nil

    property role_last_used : RoleLastUsed | Nil

    def initialize(
      @path : String | Nil = nil,
      @role_name : String | Nil = nil,
      @role_id : String | Nil = nil,
      @arn : String | Nil = nil,
      @create_date : Time | Nil = nil,
      @assume_role_policy_document : String | Nil = nil,
      @instance_profile_list : Array(InstanceProfile) | Nil = nil,
      @role_policy_list : Array(PolicyDetail) | Nil = nil,
      @attached_managed_policies : Array(AttachedPolicy) | Nil = nil,
      @permissions_boundary : AttachedPermissionsBoundary | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @role_last_used : RoleLastUsed | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @path
        params << {"#{prefix}Path", value}
      end

      if value = @role_name
        params << {"#{prefix}RoleName", value}
      end

      if value = @role_id
        params << {"#{prefix}RoleId", value}
      end

      if value = @arn
        params << {"#{prefix}Arn", value}
      end

      if value = @create_date
        params << {"#{prefix}CreateDate", Core::QueryValue.time(value)}
      end

      if value = @assume_role_policy_document
        params << {"#{prefix}AssumeRolePolicyDocument", value}
      end

      (@instance_profile_list || [] of InstanceProfile).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}InstanceProfileList.member.#{i}."))
      end

      (@role_policy_list || [] of PolicyDetail).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RolePolicyList.member.#{i}."))
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

      if value = @role_last_used
        params.concat(value.to_query_params("#{prefix}RoleLastUsed."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")),
        role_name: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleName']")),
        role_id: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleId']")),
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")),
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")),
        assume_role_policy_document: Core::XMLValue.string(node.xpath_node("*[local-name()='AssumeRolePolicyDocument']")),
        instance_profile_list: node.xpath_nodes("*[local-name()='InstanceProfileList']/*[local-name()='member']").map { |n| InstanceProfile.from_xml(n) },
        role_policy_list: node.xpath_nodes("*[local-name()='RolePolicyList']/*[local-name()='member']").map { |n| PolicyDetail.from_xml(n) },
        attached_managed_policies: node.xpath_nodes("*[local-name()='AttachedManagedPolicies']/*[local-name()='member']").map { |n| AttachedPolicy.from_xml(n) },
        permissions_boundary: node.xpath_node("*[local-name()='PermissionsBoundary']").try { |n| AttachedPermissionsBoundary.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
        role_last_used: node.xpath_node("*[local-name()='RoleLastUsed']").try { |n| RoleLastUsed.from_xml(n) },
      )
    end
  end
end
