private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteClientVpnRouteRequest
    # The ID of the Client VPN endpoint from which the route is to be deleted.
    property client_vpn_endpoint_id : String

    # The ID of the target subnet used by the route.
    property target_vpc_subnet_id : String | Nil

    # The IPv4 address range, in CIDR notation, of the route to be deleted.
    property destination_cidr_block : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @client_vpn_endpoint_id : String,
      @destination_cidr_block : String,
      @target_vpc_subnet_id : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ClientVpnEndpointId", @client_vpn_endpoint_id}

      if value = @target_vpc_subnet_id
        params << {"#{prefix}TargetVpcSubnetId", value}
      end

      params << {"#{prefix}DestinationCidrBlock", @destination_cidr_block}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_vpn_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientVpnEndpointId']")).not_nil!,
        target_vpc_subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TargetVpcSubnetId']")),
        destination_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='DestinationCidrBlock']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@client_vpn_endpoint_id, @target_vpc_subnet_id, @destination_cidr_block, @dry_run)
  end
end
