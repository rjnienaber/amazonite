private alias Core = Amazonite::Core

module Amazonite::IamV1
  class CreateRoleRequest
    property path : String | Nil

    property role_name : String

    property assume_role_policy_document : String

    property description : String | Nil

    property max_session_duration : Int32 | Nil

    property permissions_boundary : String | Nil

    property tags : Array(Tag) | Nil

    def initialize(
      @role_name : String,
      @assume_role_policy_document : String,
      @path : String | Nil = nil,
      @description : String | Nil = nil,
      @max_session_duration : Int32 | Nil = nil,
      @permissions_boundary : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @path
        params << {"#{prefix}Path", value}
      end

      params << {"#{prefix}RoleName", @role_name}

      params << {"#{prefix}AssumeRolePolicyDocument", @assume_role_policy_document}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @max_session_duration
        params << {"#{prefix}MaxSessionDuration", value.to_s}
      end

      if value = @permissions_boundary
        params << {"#{prefix}PermissionsBoundary", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")),
        role_name: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleName']")).not_nil!,
        assume_role_policy_document: Core::XMLValue.string(node.xpath_node("*[local-name()='AssumeRolePolicyDocument']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        max_session_duration: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxSessionDuration']")),
        permissions_boundary: Core::XMLValue.string(node.xpath_node("*[local-name()='PermissionsBoundary']")),
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end
  end
end
