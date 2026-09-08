private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for CreateNetworkInterfacePermission.
  class CreateNetworkInterfacePermissionRequest
    # The ID of the network interface.
    property network_interface_id : String

    # The Amazon Web Services account ID.
    property aws_account_id : String | Nil

    # The Amazon Web Services service. Currently not supported.
    property aws_service : String | Nil

    # The type of permission to grant.
    property permission : InterfacePermissionType

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @network_interface_id : String,
      @permission : InterfacePermissionType,
      @aws_account_id : String | Nil = nil,
      @aws_service : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}NetworkInterfaceId", @network_interface_id}

      if value = @aws_account_id
        params << {"#{prefix}AwsAccountId", value}
      end

      if value = @aws_service
        params << {"#{prefix}AwsService", value}
      end

      params << {"#{prefix}Permission", @permission.to_json_object_key}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='NetworkInterfaceId']")).not_nil!,
        aws_account_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AwsAccountId']")),
        aws_service: Core::XMLValue.string(node.xpath_node("*[local-name()='AwsService']")),
        permission: ((n = node.xpath_node("*[local-name()='Permission']")) ? AEC::InterfacePermissionType.from_json_object_key?(n.content) : nil).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@network_interface_id, @aws_account_id, @aws_service, @permission, @dry_run)
  end
end
