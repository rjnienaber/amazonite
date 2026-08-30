private alias Core = Amazonite::Core

module Amazonite::IamV1
  class DeleteUserPermissionsBoundaryRequest
    # The name (friendly name, not ARN) of the IAM user from which you want to remove the permissions
    # boundary.
    property user_name : String

    def initialize(
      @user_name : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}UserName", @user_name}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")).not_nil!,
      )
    end

    def_equals_and_hash(@user_name)
  end
end
