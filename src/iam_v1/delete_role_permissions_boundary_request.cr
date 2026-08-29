private alias Core = Amazonite::Core

module Amazonite::IamV1
  class DeleteRolePermissionsBoundaryRequest
    # The name (friendly name, not ARN) of the IAM role from which you want to remove the permissions
    # boundary.
    property role_name : String

    def initialize(
      @role_name : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}RoleName", @role_name}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        role_name: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleName']")).not_nil!,
      )
    end
  end
end
