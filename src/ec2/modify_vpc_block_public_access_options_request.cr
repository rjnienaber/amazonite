private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVpcBlockPublicAccessOptionsRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The mode of VPC BPA.
    #
    # - `off`: VPC BPA is not enabled and traffic is allowed to and from internet gateways and
    # egress-only internet gateways in this Region.
    #
    # - `block-bidirectional`: Block all traffic to and from internet gateways and egress-only
    # internet gateways in this Region (except for excluded VPCs and subnets).
    #
    # - `block-ingress`: Block all internet traffic to the VPCs in this Region (except for VPCs or
    # subnets which are excluded). Only traffic to and from NAT gateways and egress-only internet
    # gateways is allowed because these gateways only allow outbound connections to be established.
    property internet_gateway_block_mode : InternetGatewayBlockMode

    def initialize(
      @internet_gateway_block_mode : InternetGatewayBlockMode,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}InternetGatewayBlockMode", @internet_gateway_block_mode.to_json_object_key}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        internet_gateway_block_mode: ((n = node.xpath_node("*[local-name()='InternetGatewayBlockMode']")) ? AEC::InternetGatewayBlockMode.from_json_object_key?(n.content) : nil).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @internet_gateway_block_mode)
  end
end
