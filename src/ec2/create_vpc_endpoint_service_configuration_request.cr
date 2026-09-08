private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateVpcEndpointServiceConfigurationRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Indicates whether requests from service consumers to create an endpoint to your service must be
    # accepted manually.
    property acceptance_required : Bool | Nil

    # (Interface endpoint configuration) The private DNS name to assign to the VPC endpoint service.
    property private_dns_name : String | Nil

    # The Amazon Resource Names (ARNs) of the Network Load Balancers.
    property network_load_balancer_arns : Array(String) | Nil

    # The Amazon Resource Names (ARNs) of the Gateway Load Balancers.
    property gateway_load_balancer_arns : Array(String) | Nil

    # The supported IP address types. The possible values are `ipv4` and `ipv6`.
    property supported_ip_address_types : Array(String) | Nil

    # The Regions from which service consumers can access the service.
    property supported_regions : Array(String) | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [How to ensure
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # The tags to associate with the service.
    property tag_specifications : Array(TagSpecification) | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @acceptance_required : Bool | Nil = nil,
      @private_dns_name : String | Nil = nil,
      @network_load_balancer_arns : Array(String) | Nil = nil,
      @gateway_load_balancer_arns : Array(String) | Nil = nil,
      @supported_ip_address_types : Array(String) | Nil = nil,
      @supported_regions : Array(String) | Nil = nil,
      @client_token : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @acceptance_required
        params << {"#{prefix}AcceptanceRequired", Core::QueryValue.bool(value)}
      end

      if value = @private_dns_name
        params << {"#{prefix}PrivateDnsName", value}
      end

      (@network_load_balancer_arns || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}NetworkLoadBalancerArn.#{i}", item}
      end

      (@gateway_load_balancer_arns || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}GatewayLoadBalancerArn.#{i}", item}
      end

      (@supported_ip_address_types || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SupportedIpAddressType.#{i}", item}
      end

      (@supported_regions || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SupportedRegion.#{i}", item}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        acceptance_required: Core::XMLValue.bool(node.xpath_node("*[local-name()='AcceptanceRequired']")),
        private_dns_name: Core::XMLValue.string(node.xpath_node("*[local-name()='PrivateDnsName']")),
        network_load_balancer_arns: node.xpath_nodes("*[local-name()='NetworkLoadBalancerArn']/*[local-name()='item']").map { |n| n.content },
        gateway_load_balancer_arns: node.xpath_nodes("*[local-name()='GatewayLoadBalancerArn']/*[local-name()='item']").map { |n| n.content },
        supported_ip_address_types: node.xpath_nodes("*[local-name()='SupportedIpAddressType']/*[local-name()='item']").map { |n| n.content },
        supported_regions: node.xpath_nodes("*[local-name()='SupportedRegion']/*[local-name()='item']").map { |n| n.content },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @acceptance_required, @private_dns_name, @network_load_balancer_arns, @gateway_load_balancer_arns, @supported_ip_address_types, @supported_regions, @client_token, @tag_specifications)
  end
end
