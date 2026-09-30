private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output of CreateNetworkInterfacePermission.
  class CreateNetworkInterfacePermissionResult
    # Information about the permission for the network interface.
    property interface_permission : NetworkInterfacePermission | Nil

    def initialize(
      @interface_permission : NetworkInterfacePermission | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @interface_permission
        params.concat(value.to_query_params("#{prefix}InterfacePermission."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        interface_permission: node.xpath_node("*[local-name()='interfacePermission']").try { |n| NetworkInterfacePermission.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @interface_permission
        value.validate!
      end
    end

    def_equals_and_hash(@interface_permission)
  end
end
