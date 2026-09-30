private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateClientVpnRouteRequest
    # The ID of the Client VPN endpoint to which to add the route.
    property client_vpn_endpoint_id : String

    # The IPv4 address range, in CIDR notation, of the route destination. For example:
    #
    # - To add a route for Internet access, enter `0.0.0.0/0`
    #
    # - To add a route for a peered VPC, enter the peered VPC's IPv4 CIDR range
    #
    # - To add a route for an on-premises network, enter the Amazon Web Services Site-to-Site VPN
    # connection's IPv4 CIDR range
    #
    # - To add a route for the local network, enter the client CIDR range
    property destination_cidr_block : String

    # The ID of the subnet through which you want to route traffic. The specified subnet must be an
    # existing target network of the Client VPN endpoint.
    #
    # Alternatively, if you're adding a route for the local network, specify `local`.
    #
    # This parameter is required for VPC-based Client VPN endpoints. For Transit Gateway-based
    # endpoints, this parameter is not required.
    property target_vpc_subnet_id : String | Nil

    # A brief description of the route.
    property description : String | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @client_vpn_endpoint_id : String,
      @destination_cidr_block : String,
      @target_vpc_subnet_id : String | Nil = nil,
      @description : String | Nil = nil,
      @client_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ClientVpnEndpointId", @client_vpn_endpoint_id}

      params << {"#{prefix}DestinationCidrBlock", @destination_cidr_block}

      if value = @target_vpc_subnet_id
        params << {"#{prefix}TargetVpcSubnetId", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
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
        client_vpn_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientVpnEndpointId']")).not_nil!,
        destination_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='DestinationCidrBlock']")).not_nil!,
        target_vpc_subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TargetVpcSubnetId']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@client_vpn_endpoint_id, @destination_cidr_block, @target_vpc_subnet_id, @description, @client_token, @dry_run)
  end
end
