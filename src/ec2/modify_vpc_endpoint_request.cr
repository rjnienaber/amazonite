private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVpcEndpointRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the endpoint.
    property vpc_endpoint_id : String

    # (Gateway endpoint) Specify `true` to reset the policy document to the default policy. The
    # default policy allows full access to the service.
    property reset_policy : Bool | Nil

    # (Interface and gateway endpoints) A policy to attach to the endpoint that controls access to the
    # service. The policy must be in valid JSON format.
    property policy_document : String | Nil

    # (Gateway endpoint) The IDs of the route tables to associate with the endpoint.
    property add_route_table_ids : Array(String) | Nil

    # (Gateway endpoint) The IDs of the route tables to disassociate from the endpoint.
    property remove_route_table_ids : Array(String) | Nil

    # (Interface and Gateway Load Balancer endpoints) The IDs of the subnets in which to serve the
    # endpoint. For a Gateway Load Balancer endpoint, you can specify only one subnet.
    property add_subnet_ids : Array(String) | Nil

    # (Interface endpoint) The IDs of the subnets from which to remove the endpoint.
    property remove_subnet_ids : Array(String) | Nil

    # (Interface endpoint) The IDs of the security groups to associate with the endpoint network
    # interfaces.
    property add_security_group_ids : Array(String) | Nil

    # (Interface endpoint) The IDs of the security groups to disassociate from the endpoint network
    # interfaces.
    property remove_security_group_ids : Array(String) | Nil

    # The IP address type for the endpoint.
    property ip_address_type : IpAddressType | Nil

    # The DNS options for the endpoint.
    property dns_options : DnsOptionsSpecification | Nil

    # (Interface endpoint) Indicates whether a private hosted zone is associated with the VPC.
    property private_dns_enabled : Bool | Nil

    # The subnet configurations for the endpoint.
    property subnet_configurations : Array(SubnetConfiguration) | Nil

    def initialize(
      @vpc_endpoint_id : String,
      @dry_run : Bool | Nil = nil,
      @reset_policy : Bool | Nil = nil,
      @policy_document : String | Nil = nil,
      @add_route_table_ids : Array(String) | Nil = nil,
      @remove_route_table_ids : Array(String) | Nil = nil,
      @add_subnet_ids : Array(String) | Nil = nil,
      @remove_subnet_ids : Array(String) | Nil = nil,
      @add_security_group_ids : Array(String) | Nil = nil,
      @remove_security_group_ids : Array(String) | Nil = nil,
      @ip_address_type : IpAddressType | Nil = nil,
      @dns_options : DnsOptionsSpecification | Nil = nil,
      @private_dns_enabled : Bool | Nil = nil,
      @subnet_configurations : Array(SubnetConfiguration) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}VpcEndpointId", @vpc_endpoint_id}

      if value = @reset_policy
        params << {"#{prefix}ResetPolicy", Core::QueryValue.bool(value)}
      end

      if value = @policy_document
        params << {"#{prefix}PolicyDocument", value}
      end

      (@add_route_table_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AddRouteTableId.#{i}", item}
      end

      (@remove_route_table_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}RemoveRouteTableId.#{i}", item}
      end

      (@add_subnet_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AddSubnetId.#{i}", item}
      end

      (@remove_subnet_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}RemoveSubnetId.#{i}", item}
      end

      (@add_security_group_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AddSecurityGroupId.#{i}", item}
      end

      (@remove_security_group_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}RemoveSecurityGroupId.#{i}", item}
      end

      if value = @ip_address_type
        params << {"#{prefix}IpAddressType", value.to_json_object_key}
      end

      if value = @dns_options
        params.concat(value.to_query_params("#{prefix}DnsOptions."))
      end

      if value = @private_dns_enabled
        params << {"#{prefix}PrivateDnsEnabled", Core::QueryValue.bool(value)}
      end

      (@subnet_configurations || [] of SubnetConfiguration).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SubnetConfiguration.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        vpc_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpcEndpointId']")).not_nil!,
        reset_policy: Core::XMLValue.bool(node.xpath_node("*[local-name()='ResetPolicy']")),
        policy_document: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyDocument']")),
        add_route_table_ids: node.xpath_nodes("*[local-name()='AddRouteTableId']/*[local-name()='item']").map { |n| n.content },
        remove_route_table_ids: node.xpath_nodes("*[local-name()='RemoveRouteTableId']/*[local-name()='item']").map { |n| n.content },
        add_subnet_ids: node.xpath_nodes("*[local-name()='AddSubnetId']/*[local-name()='item']").map { |n| n.content },
        remove_subnet_ids: node.xpath_nodes("*[local-name()='RemoveSubnetId']/*[local-name()='item']").map { |n| n.content },
        add_security_group_ids: node.xpath_nodes("*[local-name()='AddSecurityGroupId']/*[local-name()='item']").map { |n| n.content },
        remove_security_group_ids: node.xpath_nodes("*[local-name()='RemoveSecurityGroupId']/*[local-name()='item']").map { |n| n.content },
        ip_address_type: (n = node.xpath_node("*[local-name()='IpAddressType']")) ? AEC::IpAddressType.from_json_object_key?(n.content) : nil,
        dns_options: node.xpath_node("*[local-name()='DnsOptions']").try { |n| DnsOptionsSpecification.from_xml(n) },
        private_dns_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='PrivateDnsEnabled']")),
        subnet_configurations: node.xpath_nodes("*[local-name()='SubnetConfiguration']/*[local-name()='item']").map { |n| SubnetConfiguration.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @dns_options
        value.validate!
      end

      if value = @subnet_configurations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @vpc_endpoint_id, @reset_policy, @policy_document, @add_route_table_ids, @remove_route_table_ids, @add_subnet_ids, @remove_subnet_ids, @add_security_group_ids, @remove_security_group_ids, @ip_address_type, @dns_options, @private_dns_enabled, @subnet_configurations)
  end
end
