private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVerifiedAccessEndpointRequest
    # The ID of the Verified Access endpoint.
    property verified_access_endpoint_id : String

    # The ID of the Verified Access group.
    property verified_access_group_id : String | Nil

    # The load balancer details if creating the Verified Access endpoint as `load-balancer`type.
    property load_balancer_options : ModifyVerifiedAccessEndpointLoadBalancerOptions | Nil

    # The network interface options.
    property network_interface_options : ModifyVerifiedAccessEndpointEniOptions | Nil

    # A description for the Verified Access endpoint.
    property description : String | Nil

    # A unique, case-sensitive token that you provide to ensure idempotency of your modification
    # request. For more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The RDS options.
    property rds_options : ModifyVerifiedAccessEndpointRdsOptions | Nil

    # The CIDR options.
    property cidr_options : ModifyVerifiedAccessEndpointCidrOptions | Nil

    def initialize(
      @verified_access_endpoint_id : String,
      @verified_access_group_id : String | Nil = nil,
      @load_balancer_options : ModifyVerifiedAccessEndpointLoadBalancerOptions | Nil = nil,
      @network_interface_options : ModifyVerifiedAccessEndpointEniOptions | Nil = nil,
      @description : String | Nil = nil,
      @client_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @rds_options : ModifyVerifiedAccessEndpointRdsOptions | Nil = nil,
      @cidr_options : ModifyVerifiedAccessEndpointCidrOptions | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}VerifiedAccessEndpointId", @verified_access_endpoint_id}

      if value = @verified_access_group_id
        params << {"#{prefix}VerifiedAccessGroupId", value}
      end

      if value = @load_balancer_options
        params.concat(value.to_query_params("#{prefix}LoadBalancerOptions."))
      end

      if value = @network_interface_options
        params.concat(value.to_query_params("#{prefix}NetworkInterfaceOptions."))
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

      if value = @rds_options
        params.concat(value.to_query_params("#{prefix}RdsOptions."))
      end

      if value = @cidr_options
        params.concat(value.to_query_params("#{prefix}CidrOptions."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        verified_access_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VerifiedAccessEndpointId']")).not_nil!,
        verified_access_group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VerifiedAccessGroupId']")),
        load_balancer_options: node.xpath_node("*[local-name()='LoadBalancerOptions']").try { |n| ModifyVerifiedAccessEndpointLoadBalancerOptions.from_xml(n) },
        network_interface_options: node.xpath_node("*[local-name()='NetworkInterfaceOptions']").try { |n| ModifyVerifiedAccessEndpointEniOptions.from_xml(n) },
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        rds_options: node.xpath_node("*[local-name()='RdsOptions']").try { |n| ModifyVerifiedAccessEndpointRdsOptions.from_xml(n) },
        cidr_options: node.xpath_node("*[local-name()='CidrOptions']").try { |n| ModifyVerifiedAccessEndpointCidrOptions.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @load_balancer_options
        value.validate!
      end

      if value = @network_interface_options
        value.validate!
      end

      if value = @rds_options
        value.validate!
      end

      if value = @cidr_options
        value.validate!
      end
    end

    def_equals_and_hash(@verified_access_endpoint_id, @verified_access_group_id, @load_balancer_options, @network_interface_options, @description, @client_token, @dry_run, @rds_options, @cidr_options)
  end
end
