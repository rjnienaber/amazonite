private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for DetachVpnGateway.
  class DetachVpnGatewayRequest
    # The ID of the VPC.
    property vpc_id : String

    # The ID of the virtual private gateway.
    property vpn_gateway_id : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @vpc_id : String,
      @vpn_gateway_id : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}VpcId", @vpc_id}

      params << {"#{prefix}VpnGatewayId", @vpn_gateway_id}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpcId']")).not_nil!,
        vpn_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpnGatewayId']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@vpc_id, @vpn_gateway_id, @dry_run)
  end
end
