private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class AttachedPermissionsBoundary
    property permissions_boundary_type : PermissionsBoundaryAttachmentType | Nil

    property permissions_boundary_arn : String | Nil

    def initialize(
      @permissions_boundary_type : PermissionsBoundaryAttachmentType | Nil = nil,
      @permissions_boundary_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @permissions_boundary_type
        params << {"#{prefix}PermissionsBoundaryType", value.to_json_object_key}
      end

      if value = @permissions_boundary_arn
        params << {"#{prefix}PermissionsBoundaryArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        permissions_boundary_type: (n = node.xpath_node("*[local-name()='PermissionsBoundaryType']")) ? AI::PermissionsBoundaryAttachmentType.from_json_object_key?(n.content) : nil,
        permissions_boundary_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PermissionsBoundaryArn']")),
      )
    end
  end
end
