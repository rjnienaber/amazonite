private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # VPC Block Public Access (BPA) enables you to block resources in VPCs and subnets that you own in
  # a Region from reaching or being reached from the internet through internet gateways and
  # egress-only internet gateways. To learn more about VPC BPA, see [Block public access to VPCs and
  # subnets](https://docs.aws.amazon.com/vpc/latest/userguide/security-vpc-bpa.html) in the *Amazon
  # VPC User Guide*.
  class VpcBlockPublicAccessOptions
    # An Amazon Web Services account ID.
    property aws_account_id : String | Nil

    # An Amazon Web Services Region.
    property aws_region : String | Nil

    # The current state of VPC BPA.
    property state : VpcBlockPublicAccessState | Nil

    # The current mode of VPC BPA.
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
    property internet_gateway_block_mode : InternetGatewayBlockMode | Nil

    # The reason for the current state.
    property reason : String | Nil

    # The last time the VPC BPA mode was updated.
    property last_update_timestamp : Time | Nil

    # The entity that manages the state of VPC BPA. Possible values include:
    #
    # - `account` - The state is managed by the account.
    #
    # - `declarative-policy` - The state is managed by a declarative policy and can't be modified by
    # the account.
    property managed_by : ManagedBy | Nil

    # Determines if exclusions are allowed. If you have [enabled VPC BPA at the Organization
    # level](https://docs.aws.amazon.com/vpc/latest/userguide/security-vpc-bpa.html#security-vpc-bpa-exclusions-orgs),
    # exclusions may be `not-allowed`. Otherwise, they are `allowed`.
    property exclusions_allowed : VpcBlockPublicAccessExclusionsAllowed | Nil

    def initialize(
      @aws_account_id : String | Nil = nil,
      @aws_region : String | Nil = nil,
      @state : VpcBlockPublicAccessState | Nil = nil,
      @internet_gateway_block_mode : InternetGatewayBlockMode | Nil = nil,
      @reason : String | Nil = nil,
      @last_update_timestamp : Time | Nil = nil,
      @managed_by : ManagedBy | Nil = nil,
      @exclusions_allowed : VpcBlockPublicAccessExclusionsAllowed | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @aws_account_id
        params << {"#{prefix}AwsAccountId", value}
      end

      if value = @aws_region
        params << {"#{prefix}AwsRegion", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @internet_gateway_block_mode
        params << {"#{prefix}InternetGatewayBlockMode", value.to_json_object_key}
      end

      if value = @reason
        params << {"#{prefix}Reason", value}
      end

      if value = @last_update_timestamp
        params << {"#{prefix}LastUpdateTimestamp", Core::QueryValue.time(value)}
      end

      if value = @managed_by
        params << {"#{prefix}ManagedBy", value.to_json_object_key}
      end

      if value = @exclusions_allowed
        params << {"#{prefix}ExclusionsAllowed", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        aws_account_id: Core::XMLValue.string(node.xpath_node("*[local-name()='awsAccountId']")),
        aws_region: Core::XMLValue.string(node.xpath_node("*[local-name()='awsRegion']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::VpcBlockPublicAccessState.from_json_object_key?(n.content) : nil,
        internet_gateway_block_mode: (n = node.xpath_node("*[local-name()='internetGatewayBlockMode']")) ? AEC::InternetGatewayBlockMode.from_json_object_key?(n.content) : nil,
        reason: Core::XMLValue.string(node.xpath_node("*[local-name()='reason']")),
        last_update_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='lastUpdateTimestamp']")),
        managed_by: (n = node.xpath_node("*[local-name()='managedBy']")) ? AEC::ManagedBy.from_json_object_key?(n.content) : nil,
        exclusions_allowed: (n = node.xpath_node("*[local-name()='exclusionsAllowed']")) ? AEC::VpcBlockPublicAccessExclusionsAllowed.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@aws_account_id, @aws_region, @state, @internet_gateway_block_mode, @reason, @last_update_timestamp, @managed_by, @exclusions_allowed)
  end
end
