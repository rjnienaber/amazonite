private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVpcEndpointServiceConfigurationRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the service.
    property service_id : String

    # (Interface endpoint configuration) The private DNS name to assign to the endpoint service.
    property private_dns_name : String | Nil

    # (Interface endpoint configuration) Removes the private DNS name of the endpoint service.
    property remove_private_dns_name : Bool | Nil

    # Indicates whether requests to create an endpoint to the service must be accepted.
    property acceptance_required : Bool | Nil

    # The Amazon Resource Names (ARNs) of Network Load Balancers to add to the service configuration.
    property add_network_load_balancer_arns : Array(String) | Nil

    # The Amazon Resource Names (ARNs) of Network Load Balancers to remove from the service
    # configuration.
    property remove_network_load_balancer_arns : Array(String) | Nil

    # The Amazon Resource Names (ARNs) of Gateway Load Balancers to add to the service configuration.
    property add_gateway_load_balancer_arns : Array(String) | Nil

    # The Amazon Resource Names (ARNs) of Gateway Load Balancers to remove from the service
    # configuration.
    property remove_gateway_load_balancer_arns : Array(String) | Nil

    # The IP address types to add to the service configuration.
    property add_supported_ip_address_types : Array(String) | Nil

    # The IP address types to remove from the service configuration.
    property remove_supported_ip_address_types : Array(String) | Nil

    # The supported Regions to add to the service configuration.
    property add_supported_regions : Array(String) | Nil

    # The supported Regions to remove from the service configuration.
    property remove_supported_regions : Array(String) | Nil

    def initialize(
      @service_id : String,
      @dry_run : Bool | Nil = nil,
      @private_dns_name : String | Nil = nil,
      @remove_private_dns_name : Bool | Nil = nil,
      @acceptance_required : Bool | Nil = nil,
      @add_network_load_balancer_arns : Array(String) | Nil = nil,
      @remove_network_load_balancer_arns : Array(String) | Nil = nil,
      @add_gateway_load_balancer_arns : Array(String) | Nil = nil,
      @remove_gateway_load_balancer_arns : Array(String) | Nil = nil,
      @add_supported_ip_address_types : Array(String) | Nil = nil,
      @remove_supported_ip_address_types : Array(String) | Nil = nil,
      @add_supported_regions : Array(String) | Nil = nil,
      @remove_supported_regions : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}ServiceId", @service_id}

      if value = @private_dns_name
        params << {"#{prefix}PrivateDnsName", value}
      end

      if value = @remove_private_dns_name
        params << {"#{prefix}RemovePrivateDnsName", Core::QueryValue.bool(value)}
      end

      if value = @acceptance_required
        params << {"#{prefix}AcceptanceRequired", Core::QueryValue.bool(value)}
      end

      (@add_network_load_balancer_arns || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AddNetworkLoadBalancerArn.#{i}", item}
      end

      (@remove_network_load_balancer_arns || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}RemoveNetworkLoadBalancerArn.#{i}", item}
      end

      (@add_gateway_load_balancer_arns || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AddGatewayLoadBalancerArn.#{i}", item}
      end

      (@remove_gateway_load_balancer_arns || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}RemoveGatewayLoadBalancerArn.#{i}", item}
      end

      (@add_supported_ip_address_types || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AddSupportedIpAddressType.#{i}", item}
      end

      (@remove_supported_ip_address_types || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}RemoveSupportedIpAddressType.#{i}", item}
      end

      (@add_supported_regions || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AddSupportedRegion.#{i}", item}
      end

      (@remove_supported_regions || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}RemoveSupportedRegion.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        service_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceId']")).not_nil!,
        private_dns_name: Core::XMLValue.string(node.xpath_node("*[local-name()='PrivateDnsName']")),
        remove_private_dns_name: Core::XMLValue.bool(node.xpath_node("*[local-name()='RemovePrivateDnsName']")),
        acceptance_required: Core::XMLValue.bool(node.xpath_node("*[local-name()='AcceptanceRequired']")),
        add_network_load_balancer_arns: node.xpath_nodes("*[local-name()='AddNetworkLoadBalancerArn']/*[local-name()='item']").map { |n| n.content },
        remove_network_load_balancer_arns: node.xpath_nodes("*[local-name()='RemoveNetworkLoadBalancerArn']/*[local-name()='item']").map { |n| n.content },
        add_gateway_load_balancer_arns: node.xpath_nodes("*[local-name()='AddGatewayLoadBalancerArn']/*[local-name()='item']").map { |n| n.content },
        remove_gateway_load_balancer_arns: node.xpath_nodes("*[local-name()='RemoveGatewayLoadBalancerArn']/*[local-name()='item']").map { |n| n.content },
        add_supported_ip_address_types: node.xpath_nodes("*[local-name()='AddSupportedIpAddressType']/*[local-name()='item']").map { |n| n.content },
        remove_supported_ip_address_types: node.xpath_nodes("*[local-name()='RemoveSupportedIpAddressType']/*[local-name()='item']").map { |n| n.content },
        add_supported_regions: node.xpath_nodes("*[local-name()='AddSupportedRegion']/*[local-name()='item']").map { |n| n.content },
        remove_supported_regions: node.xpath_nodes("*[local-name()='RemoveSupportedRegion']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @service_id, @private_dns_name, @remove_private_dns_name, @acceptance_required, @add_network_load_balancer_arns, @remove_network_load_balancer_arns, @add_gateway_load_balancer_arns, @remove_gateway_load_balancer_arns, @add_supported_ip_address_types, @remove_supported_ip_address_types, @add_supported_regions, @remove_supported_regions)
  end
end
