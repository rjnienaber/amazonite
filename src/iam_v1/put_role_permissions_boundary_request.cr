private alias Core = Amazonite::Core

module Amazonite::IamV1
  class PutRolePermissionsBoundaryRequest
    property role_name : String

    property permissions_boundary : String

    def initialize(
      @role_name : String,
      @permissions_boundary : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}RoleName", @role_name}

      params << {"#{prefix}PermissionsBoundary", @permissions_boundary}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        role_name: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleName']")).not_nil!,
        permissions_boundary: Core::XMLValue.string(node.xpath_node("*[local-name()='PermissionsBoundary']")).not_nil!,
      )
    end
  end
end
