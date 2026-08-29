private alias Core = Amazonite::Core

module Amazonite::IamV1
  class Role
    property path : String

    property role_name : String

    property role_id : String

    property arn : String

    property create_date : Time

    property assume_role_policy_document : String | Nil

    property description : String | Nil

    property max_session_duration : Int32 | Nil

    property permissions_boundary : AttachedPermissionsBoundary | Nil

    property tags : Array(Tag) | Nil

    property role_last_used : RoleLastUsed | Nil

    property source_role_template : SourceRoleTemplate | Nil

    def initialize(
      @path : String,
      @role_name : String,
      @role_id : String,
      @arn : String,
      @create_date : Time,
      @assume_role_policy_document : String | Nil = nil,
      @description : String | Nil = nil,
      @max_session_duration : Int32 | Nil = nil,
      @permissions_boundary : AttachedPermissionsBoundary | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @role_last_used : RoleLastUsed | Nil = nil,
      @source_role_template : SourceRoleTemplate | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Path", @path}

      params << {"#{prefix}RoleName", @role_name}

      params << {"#{prefix}RoleId", @role_id}

      params << {"#{prefix}Arn", @arn}

      params << {"#{prefix}CreateDate", Core::QueryValue.time(@create_date)}

      if value = @assume_role_policy_document
        params << {"#{prefix}AssumeRolePolicyDocument", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @max_session_duration
        params << {"#{prefix}MaxSessionDuration", value.to_s}
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

      if value = @source_role_template
        params.concat(value.to_query_params("#{prefix}SourceRoleTemplate."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")).not_nil!,
        role_name: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleName']")).not_nil!,
        role_id: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleId']")).not_nil!,
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")).not_nil!,
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")).not_nil!,
        assume_role_policy_document: Core::XMLValue.string(node.xpath_node("*[local-name()='AssumeRolePolicyDocument']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        max_session_duration: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxSessionDuration']")),
        permissions_boundary: node.xpath_node("*[local-name()='PermissionsBoundary']").try { |n| AttachedPermissionsBoundary.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
        role_last_used: node.xpath_node("*[local-name()='RoleLastUsed']").try { |n| RoleLastUsed.from_xml(n) },
        source_role_template: node.xpath_node("*[local-name()='SourceRoleTemplate']").try { |n| SourceRoleTemplate.from_xml(n) },
      )
    end
  end
end
