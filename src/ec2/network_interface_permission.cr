private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a permission for a network interface.
  class NetworkInterfacePermission
    # The ID of the network interface permission.
    property network_interface_permission_id : String | Nil

    # The ID of the network interface.
    property network_interface_id : String | Nil

    # The Amazon Web Services account ID.
    property aws_account_id : String | Nil

    # The Amazon Web Services service.
    property aws_service : String | Nil

    # The type of permission.
    property permission : InterfacePermissionType | Nil

    # Information about the state of the permission.
    property permission_state : NetworkInterfacePermissionState | Nil

    def initialize(
      @network_interface_permission_id : String | Nil = nil,
      @network_interface_id : String | Nil = nil,
      @aws_account_id : String | Nil = nil,
      @aws_service : String | Nil = nil,
      @permission : InterfacePermissionType | Nil = nil,
      @permission_state : NetworkInterfacePermissionState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @network_interface_permission_id
        params << {"#{prefix}NetworkInterfacePermissionId", value}
      end

      if value = @network_interface_id
        params << {"#{prefix}NetworkInterfaceId", value}
      end

      if value = @aws_account_id
        params << {"#{prefix}AwsAccountId", value}
      end

      if value = @aws_service
        params << {"#{prefix}AwsService", value}
      end

      if value = @permission
        params << {"#{prefix}Permission", value.to_json_object_key}
      end

      if value = @permission_state
        params.concat(value.to_query_params("#{prefix}PermissionState."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_interface_permission_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfacePermissionId']")),
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceId']")),
        aws_account_id: Core::XMLValue.string(node.xpath_node("*[local-name()='awsAccountId']")),
        aws_service: Core::XMLValue.string(node.xpath_node("*[local-name()='awsService']")),
        permission: (n = node.xpath_node("*[local-name()='permission']")) ? AEC::InterfacePermissionType.from_json_object_key?(n.content) : nil,
        permission_state: node.xpath_node("*[local-name()='permissionState']").try { |n| NetworkInterfacePermissionState.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @permission_state
        value.validate!
      end
    end

    def_equals_and_hash(@network_interface_permission_id, @network_interface_id, @aws_account_id, @aws_service, @permission, @permission_state)
  end
end
