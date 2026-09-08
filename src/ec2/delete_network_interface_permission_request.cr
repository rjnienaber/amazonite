private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for DeleteNetworkInterfacePermission.
  class DeleteNetworkInterfacePermissionRequest
    # The ID of the network interface permission.
    property network_interface_permission_id : String

    # Specify `true` to remove the permission even if the network interface is attached to an
    # instance.
    property force : Bool | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @network_interface_permission_id : String,
      @force : Bool | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}NetworkInterfacePermissionId", @network_interface_permission_id}

      if value = @force
        params << {"#{prefix}Force", Core::QueryValue.bool(value)}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_interface_permission_id: Core::XMLValue.string(node.xpath_node("*[local-name()='NetworkInterfacePermissionId']")).not_nil!,
        force: Core::XMLValue.bool(node.xpath_node("*[local-name()='Force']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@network_interface_permission_id, @force, @dry_run)
  end
end
