private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # The state of VPC Block Public Access (BPA).
  class BlockPublicAccessStates
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
    property internet_gateway_block_mode : BlockPublicAccessMode | Nil

    def initialize(
      @internet_gateway_block_mode : BlockPublicAccessMode | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @internet_gateway_block_mode
        params << {"#{prefix}InternetGatewayBlockMode", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        internet_gateway_block_mode: (n = node.xpath_node("*[local-name()='internetGatewayBlockMode']")) ? AEC::BlockPublicAccessMode.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@internet_gateway_block_mode)
  end
end
