private alias Core = Amazonite::Core

module Amazonite::EC2
  class AssociateTrunkInterfaceRequest
    # The ID of the branch network interface.
    property branch_interface_id : String

    # The ID of the trunk network interface.
    property trunk_interface_id : String

    # The ID of the VLAN. This applies to the VLAN protocol.
    property vlan_id : Int32 | Nil

    # The application key. This applies to the GRE protocol.
    property gre_key : Int32 | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @branch_interface_id : String,
      @trunk_interface_id : String,
      @vlan_id : Int32 | Nil = nil,
      @gre_key : Int32 | Nil = nil,
      @client_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}BranchInterfaceId", @branch_interface_id}

      params << {"#{prefix}TrunkInterfaceId", @trunk_interface_id}

      if value = @vlan_id
        params << {"#{prefix}VlanId", value.to_s}
      end

      if value = @gre_key
        params << {"#{prefix}GreKey", value.to_s}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        branch_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='BranchInterfaceId']")).not_nil!,
        trunk_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TrunkInterfaceId']")).not_nil!,
        vlan_id: Core::XMLValue.i32(node.xpath_node("*[local-name()='VlanId']")),
        gre_key: Core::XMLValue.i32(node.xpath_node("*[local-name()='GreKey']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@branch_interface_id, @trunk_interface_id, @vlan_id, @gre_key, @client_token, @dry_run)
  end
end
