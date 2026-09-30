private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an explanation code for an unreachable path. For more information, see [Reachability
  # Analyzer explanation
  # codes](https://docs.aws.amazon.com/vpc/latest/reachability/explanation-codes.html).
  class Explanation
    # The network ACL.
    property acl : AnalysisComponent | Nil

    # The network ACL rule.
    property acl_rule : AnalysisAclRule | Nil

    # The IPv4 address, in CIDR notation.
    property address : String | Nil

    # The IPv4 addresses, in CIDR notation.
    property addresses : Array(String) | Nil

    # The resource to which the component is attached.
    property attached_to : AnalysisComponent | Nil

    # The Availability Zones.
    property availability_zones : Array(String) | Nil

    # The IDs of the Availability Zones.
    property availability_zone_ids : Array(String) | Nil

    # The CIDR ranges.
    property cidrs : Array(String) | Nil

    # The component.
    property component : AnalysisComponent | Nil

    # The customer gateway.
    property customer_gateway : AnalysisComponent | Nil

    # The destination.
    property destination : AnalysisComponent | Nil

    # The destination VPC.
    property destination_vpc : AnalysisComponent | Nil

    # The direction. The following are the possible values:
    #
    # - egress
    #
    # - ingress
    property direction : String | Nil

    # The explanation code.
    property explanation_code : String | Nil

    # The route table.
    property ingress_route_table : AnalysisComponent | Nil

    # The internet gateway.
    property internet_gateway : AnalysisComponent | Nil

    # The Amazon Resource Name (ARN) of the load balancer.
    property load_balancer_arn : String | Nil

    # The listener for a Classic Load Balancer.
    property classic_load_balancer_listener : AnalysisLoadBalancerListener | Nil

    # The listener port of the load balancer.
    property load_balancer_listener_port : Int32 | Nil

    # The target.
    property load_balancer_target : AnalysisLoadBalancerTarget | Nil

    # The target group.
    property load_balancer_target_group : AnalysisComponent | Nil

    # The target groups.
    property load_balancer_target_groups : Array(AnalysisComponent) | Nil

    # The target port.
    property load_balancer_target_port : Int32 | Nil

    # The load balancer listener.
    property elastic_load_balancer_listener : AnalysisComponent | Nil

    # The missing component.
    property missing_component : String | Nil

    # The NAT gateway.
    property nat_gateway : AnalysisComponent | Nil

    # The network interface.
    property network_interface : AnalysisComponent | Nil

    # The packet field.
    property packet_field : String | Nil

    # The VPC peering connection.
    property vpc_peering_connection : AnalysisComponent | Nil

    # The port.
    property port : Int32 | Nil

    # The port ranges.
    property port_ranges : Array(PortRange) | Nil

    # The prefix list.
    property prefix_list : AnalysisComponent | Nil

    # The protocols.
    property protocols : Array(String) | Nil

    # The route table route.
    property route_table_route : AnalysisRouteTableRoute | Nil

    # The route table.
    property route_table : AnalysisComponent | Nil

    # The security group.
    property security_group : AnalysisComponent | Nil

    # The security group rule.
    property security_group_rule : AnalysisSecurityGroupRule | Nil

    # The security groups.
    property security_groups : Array(AnalysisComponent) | Nil

    # The source VPC.
    property source_vpc : AnalysisComponent | Nil

    # The state.
    property state : String | Nil

    # The subnet.
    property subnet : AnalysisComponent | Nil

    # The route table for the subnet.
    property subnet_route_table : AnalysisComponent | Nil

    # The component VPC.
    property vpc : AnalysisComponent | Nil

    # The VPC endpoint.
    property vpc_endpoint : AnalysisComponent | Nil

    # The VPN connection.
    property vpn_connection : AnalysisComponent | Nil

    # The VPN gateway.
    property vpn_gateway : AnalysisComponent | Nil

    # The transit gateway.
    property transit_gateway : AnalysisComponent | Nil

    # The transit gateway route table.
    property transit_gateway_route_table : AnalysisComponent | Nil

    # The transit gateway route table route.
    property transit_gateway_route_table_route : TransitGatewayRouteTableRoute | Nil

    # The transit gateway attachment.
    property transit_gateway_attachment : AnalysisComponent | Nil

    # The Amazon Web Services account for the component.
    property component_account : String | Nil

    # The Region for the component.
    property component_region : String | Nil

    # The Network Firewall stateless rule.
    property firewall_stateless_rule : FirewallStatelessRule | Nil

    # The Network Firewall stateful rule.
    property firewall_stateful_rule : FirewallStatefulRule | Nil

    def initialize(
      @acl : AnalysisComponent | Nil = nil,
      @acl_rule : AnalysisAclRule | Nil = nil,
      @address : String | Nil = nil,
      @addresses : Array(String) | Nil = nil,
      @attached_to : AnalysisComponent | Nil = nil,
      @availability_zones : Array(String) | Nil = nil,
      @availability_zone_ids : Array(String) | Nil = nil,
      @cidrs : Array(String) | Nil = nil,
      @component : AnalysisComponent | Nil = nil,
      @customer_gateway : AnalysisComponent | Nil = nil,
      @destination : AnalysisComponent | Nil = nil,
      @destination_vpc : AnalysisComponent | Nil = nil,
      @direction : String | Nil = nil,
      @explanation_code : String | Nil = nil,
      @ingress_route_table : AnalysisComponent | Nil = nil,
      @internet_gateway : AnalysisComponent | Nil = nil,
      @load_balancer_arn : String | Nil = nil,
      @classic_load_balancer_listener : AnalysisLoadBalancerListener | Nil = nil,
      @load_balancer_listener_port : Int32 | Nil = nil,
      @load_balancer_target : AnalysisLoadBalancerTarget | Nil = nil,
      @load_balancer_target_group : AnalysisComponent | Nil = nil,
      @load_balancer_target_groups : Array(AnalysisComponent) | Nil = nil,
      @load_balancer_target_port : Int32 | Nil = nil,
      @elastic_load_balancer_listener : AnalysisComponent | Nil = nil,
      @missing_component : String | Nil = nil,
      @nat_gateway : AnalysisComponent | Nil = nil,
      @network_interface : AnalysisComponent | Nil = nil,
      @packet_field : String | Nil = nil,
      @vpc_peering_connection : AnalysisComponent | Nil = nil,
      @port : Int32 | Nil = nil,
      @port_ranges : Array(PortRange) | Nil = nil,
      @prefix_list : AnalysisComponent | Nil = nil,
      @protocols : Array(String) | Nil = nil,
      @route_table_route : AnalysisRouteTableRoute | Nil = nil,
      @route_table : AnalysisComponent | Nil = nil,
      @security_group : AnalysisComponent | Nil = nil,
      @security_group_rule : AnalysisSecurityGroupRule | Nil = nil,
      @security_groups : Array(AnalysisComponent) | Nil = nil,
      @source_vpc : AnalysisComponent | Nil = nil,
      @state : String | Nil = nil,
      @subnet : AnalysisComponent | Nil = nil,
      @subnet_route_table : AnalysisComponent | Nil = nil,
      @vpc : AnalysisComponent | Nil = nil,
      @vpc_endpoint : AnalysisComponent | Nil = nil,
      @vpn_connection : AnalysisComponent | Nil = nil,
      @vpn_gateway : AnalysisComponent | Nil = nil,
      @transit_gateway : AnalysisComponent | Nil = nil,
      @transit_gateway_route_table : AnalysisComponent | Nil = nil,
      @transit_gateway_route_table_route : TransitGatewayRouteTableRoute | Nil = nil,
      @transit_gateway_attachment : AnalysisComponent | Nil = nil,
      @component_account : String | Nil = nil,
      @component_region : String | Nil = nil,
      @firewall_stateless_rule : FirewallStatelessRule | Nil = nil,
      @firewall_stateful_rule : FirewallStatefulRule | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @acl
        params.concat(value.to_query_params("#{prefix}Acl."))
      end

      if value = @acl_rule
        params.concat(value.to_query_params("#{prefix}AclRule."))
      end

      if value = @address
        params << {"#{prefix}Address", value}
      end

      (@addresses || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AddressSet.#{i}", item}
      end

      if value = @attached_to
        params.concat(value.to_query_params("#{prefix}AttachedTo."))
      end

      (@availability_zones || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AvailabilityZoneSet.#{i}", item}
      end

      (@availability_zone_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AvailabilityZoneIdSet.#{i}", item}
      end

      (@cidrs || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}CidrSet.#{i}", item}
      end

      if value = @component
        params.concat(value.to_query_params("#{prefix}Component."))
      end

      if value = @customer_gateway
        params.concat(value.to_query_params("#{prefix}CustomerGateway."))
      end

      if value = @destination
        params.concat(value.to_query_params("#{prefix}Destination."))
      end

      if value = @destination_vpc
        params.concat(value.to_query_params("#{prefix}DestinationVpc."))
      end

      if value = @direction
        params << {"#{prefix}Direction", value}
      end

      if value = @explanation_code
        params << {"#{prefix}ExplanationCode", value}
      end

      if value = @ingress_route_table
        params.concat(value.to_query_params("#{prefix}IngressRouteTable."))
      end

      if value = @internet_gateway
        params.concat(value.to_query_params("#{prefix}InternetGateway."))
      end

      if value = @load_balancer_arn
        params << {"#{prefix}LoadBalancerArn", value}
      end

      if value = @classic_load_balancer_listener
        params.concat(value.to_query_params("#{prefix}ClassicLoadBalancerListener."))
      end

      if value = @load_balancer_listener_port
        params << {"#{prefix}LoadBalancerListenerPort", value.to_s}
      end

      if value = @load_balancer_target
        params.concat(value.to_query_params("#{prefix}LoadBalancerTarget."))
      end

      if value = @load_balancer_target_group
        params.concat(value.to_query_params("#{prefix}LoadBalancerTargetGroup."))
      end

      (@load_balancer_target_groups || [] of AnalysisComponent).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}LoadBalancerTargetGroupSet.#{i}."))
      end

      if value = @load_balancer_target_port
        params << {"#{prefix}LoadBalancerTargetPort", value.to_s}
      end

      if value = @elastic_load_balancer_listener
        params.concat(value.to_query_params("#{prefix}ElasticLoadBalancerListener."))
      end

      if value = @missing_component
        params << {"#{prefix}MissingComponent", value}
      end

      if value = @nat_gateway
        params.concat(value.to_query_params("#{prefix}NatGateway."))
      end

      if value = @network_interface
        params.concat(value.to_query_params("#{prefix}NetworkInterface."))
      end

      if value = @packet_field
        params << {"#{prefix}PacketField", value}
      end

      if value = @vpc_peering_connection
        params.concat(value.to_query_params("#{prefix}VpcPeeringConnection."))
      end

      if value = @port
        params << {"#{prefix}Port", value.to_s}
      end

      (@port_ranges || [] of PortRange).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PortRangeSet.#{i}."))
      end

      if value = @prefix_list
        params.concat(value.to_query_params("#{prefix}PrefixList."))
      end

      (@protocols || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ProtocolSet.#{i}", item}
      end

      if value = @route_table_route
        params.concat(value.to_query_params("#{prefix}RouteTableRoute."))
      end

      if value = @route_table
        params.concat(value.to_query_params("#{prefix}RouteTable."))
      end

      if value = @security_group
        params.concat(value.to_query_params("#{prefix}SecurityGroup."))
      end

      if value = @security_group_rule
        params.concat(value.to_query_params("#{prefix}SecurityGroupRule."))
      end

      (@security_groups || [] of AnalysisComponent).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SecurityGroupSet.#{i}."))
      end

      if value = @source_vpc
        params.concat(value.to_query_params("#{prefix}SourceVpc."))
      end

      if value = @state
        params << {"#{prefix}State", value}
      end

      if value = @subnet
        params.concat(value.to_query_params("#{prefix}Subnet."))
      end

      if value = @subnet_route_table
        params.concat(value.to_query_params("#{prefix}SubnetRouteTable."))
      end

      if value = @vpc
        params.concat(value.to_query_params("#{prefix}Vpc."))
      end

      if value = @vpc_endpoint
        params.concat(value.to_query_params("#{prefix}VpcEndpoint."))
      end

      if value = @vpn_connection
        params.concat(value.to_query_params("#{prefix}VpnConnection."))
      end

      if value = @vpn_gateway
        params.concat(value.to_query_params("#{prefix}VpnGateway."))
      end

      if value = @transit_gateway
        params.concat(value.to_query_params("#{prefix}TransitGateway."))
      end

      if value = @transit_gateway_route_table
        params.concat(value.to_query_params("#{prefix}TransitGatewayRouteTable."))
      end

      if value = @transit_gateway_route_table_route
        params.concat(value.to_query_params("#{prefix}TransitGatewayRouteTableRoute."))
      end

      if value = @transit_gateway_attachment
        params.concat(value.to_query_params("#{prefix}TransitGatewayAttachment."))
      end

      if value = @component_account
        params << {"#{prefix}ComponentAccount", value}
      end

      if value = @component_region
        params << {"#{prefix}ComponentRegion", value}
      end

      if value = @firewall_stateless_rule
        params.concat(value.to_query_params("#{prefix}FirewallStatelessRule."))
      end

      if value = @firewall_stateful_rule
        params.concat(value.to_query_params("#{prefix}FirewallStatefulRule."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        acl: node.xpath_node("*[local-name()='acl']").try { |n| AnalysisComponent.from_xml(n) },
        acl_rule: node.xpath_node("*[local-name()='aclRule']").try { |n| AnalysisAclRule.from_xml(n) },
        address: Core::XMLValue.string(node.xpath_node("*[local-name()='address']")),
        addresses: node.xpath_nodes("*[local-name()='addressSet']/*[local-name()='item']").map { |n| n.content },
        attached_to: node.xpath_node("*[local-name()='attachedTo']").try { |n| AnalysisComponent.from_xml(n) },
        availability_zones: node.xpath_nodes("*[local-name()='availabilityZoneSet']/*[local-name()='item']").map { |n| n.content },
        availability_zone_ids: node.xpath_nodes("*[local-name()='availabilityZoneIdSet']/*[local-name()='item']").map { |n| n.content },
        cidrs: node.xpath_nodes("*[local-name()='cidrSet']/*[local-name()='item']").map { |n| n.content },
        component: node.xpath_node("*[local-name()='component']").try { |n| AnalysisComponent.from_xml(n) },
        customer_gateway: node.xpath_node("*[local-name()='customerGateway']").try { |n| AnalysisComponent.from_xml(n) },
        destination: node.xpath_node("*[local-name()='destination']").try { |n| AnalysisComponent.from_xml(n) },
        destination_vpc: node.xpath_node("*[local-name()='destinationVpc']").try { |n| AnalysisComponent.from_xml(n) },
        direction: Core::XMLValue.string(node.xpath_node("*[local-name()='direction']")),
        explanation_code: Core::XMLValue.string(node.xpath_node("*[local-name()='explanationCode']")),
        ingress_route_table: node.xpath_node("*[local-name()='ingressRouteTable']").try { |n| AnalysisComponent.from_xml(n) },
        internet_gateway: node.xpath_node("*[local-name()='internetGateway']").try { |n| AnalysisComponent.from_xml(n) },
        load_balancer_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='loadBalancerArn']")),
        classic_load_balancer_listener: node.xpath_node("*[local-name()='classicLoadBalancerListener']").try { |n| AnalysisLoadBalancerListener.from_xml(n) },
        load_balancer_listener_port: Core::XMLValue.i32(node.xpath_node("*[local-name()='loadBalancerListenerPort']")),
        load_balancer_target: node.xpath_node("*[local-name()='loadBalancerTarget']").try { |n| AnalysisLoadBalancerTarget.from_xml(n) },
        load_balancer_target_group: node.xpath_node("*[local-name()='loadBalancerTargetGroup']").try { |n| AnalysisComponent.from_xml(n) },
        load_balancer_target_groups: node.xpath_nodes("*[local-name()='loadBalancerTargetGroupSet']/*[local-name()='item']").map { |n| AnalysisComponent.from_xml(n) },
        load_balancer_target_port: Core::XMLValue.i32(node.xpath_node("*[local-name()='loadBalancerTargetPort']")),
        elastic_load_balancer_listener: node.xpath_node("*[local-name()='elasticLoadBalancerListener']").try { |n| AnalysisComponent.from_xml(n) },
        missing_component: Core::XMLValue.string(node.xpath_node("*[local-name()='missingComponent']")),
        nat_gateway: node.xpath_node("*[local-name()='natGateway']").try { |n| AnalysisComponent.from_xml(n) },
        network_interface: node.xpath_node("*[local-name()='networkInterface']").try { |n| AnalysisComponent.from_xml(n) },
        packet_field: Core::XMLValue.string(node.xpath_node("*[local-name()='packetField']")),
        vpc_peering_connection: node.xpath_node("*[local-name()='vpcPeeringConnection']").try { |n| AnalysisComponent.from_xml(n) },
        port: Core::XMLValue.i32(node.xpath_node("*[local-name()='port']")),
        port_ranges: node.xpath_nodes("*[local-name()='portRangeSet']/*[local-name()='item']").map { |n| PortRange.from_xml(n) },
        prefix_list: node.xpath_node("*[local-name()='prefixList']").try { |n| AnalysisComponent.from_xml(n) },
        protocols: node.xpath_nodes("*[local-name()='protocolSet']/*[local-name()='item']").map { |n| n.content },
        route_table_route: node.xpath_node("*[local-name()='routeTableRoute']").try { |n| AnalysisRouteTableRoute.from_xml(n) },
        route_table: node.xpath_node("*[local-name()='routeTable']").try { |n| AnalysisComponent.from_xml(n) },
        security_group: node.xpath_node("*[local-name()='securityGroup']").try { |n| AnalysisComponent.from_xml(n) },
        security_group_rule: node.xpath_node("*[local-name()='securityGroupRule']").try { |n| AnalysisSecurityGroupRule.from_xml(n) },
        security_groups: node.xpath_nodes("*[local-name()='securityGroupSet']/*[local-name()='item']").map { |n| AnalysisComponent.from_xml(n) },
        source_vpc: node.xpath_node("*[local-name()='sourceVpc']").try { |n| AnalysisComponent.from_xml(n) },
        state: Core::XMLValue.string(node.xpath_node("*[local-name()='state']")),
        subnet: node.xpath_node("*[local-name()='subnet']").try { |n| AnalysisComponent.from_xml(n) },
        subnet_route_table: node.xpath_node("*[local-name()='subnetRouteTable']").try { |n| AnalysisComponent.from_xml(n) },
        vpc: node.xpath_node("*[local-name()='vpc']").try { |n| AnalysisComponent.from_xml(n) },
        vpc_endpoint: node.xpath_node("*[local-name()='vpcEndpoint']").try { |n| AnalysisComponent.from_xml(n) },
        vpn_connection: node.xpath_node("*[local-name()='vpnConnection']").try { |n| AnalysisComponent.from_xml(n) },
        vpn_gateway: node.xpath_node("*[local-name()='vpnGateway']").try { |n| AnalysisComponent.from_xml(n) },
        transit_gateway: node.xpath_node("*[local-name()='transitGateway']").try { |n| AnalysisComponent.from_xml(n) },
        transit_gateway_route_table: node.xpath_node("*[local-name()='transitGatewayRouteTable']").try { |n| AnalysisComponent.from_xml(n) },
        transit_gateway_route_table_route: node.xpath_node("*[local-name()='transitGatewayRouteTableRoute']").try { |n| TransitGatewayRouteTableRoute.from_xml(n) },
        transit_gateway_attachment: node.xpath_node("*[local-name()='transitGatewayAttachment']").try { |n| AnalysisComponent.from_xml(n) },
        component_account: Core::XMLValue.string(node.xpath_node("*[local-name()='componentAccount']")),
        component_region: Core::XMLValue.string(node.xpath_node("*[local-name()='componentRegion']")),
        firewall_stateless_rule: node.xpath_node("*[local-name()='firewallStatelessRule']").try { |n| FirewallStatelessRule.from_xml(n) },
        firewall_stateful_rule: node.xpath_node("*[local-name()='firewallStatefulRule']").try { |n| FirewallStatefulRule.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @acl
        value.validate!
      end

      if value = @acl_rule
        value.validate!
      end

      if value = @address
        raise Core::ValidationError.new("Address length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Address length must be <= 15") if value.size > 15
        raise Core::ValidationError.new("Address does not match the required pattern") unless value.matches?(Regex.new("^([0-9]{1,3}.){3}[0-9]{1,3}$"))
      end

      if value = @attached_to
        value.validate!
      end

      if value = @component
        value.validate!
      end

      if value = @customer_gateway
        value.validate!
      end

      if value = @destination
        value.validate!
      end

      if value = @destination_vpc
        value.validate!
      end

      if value = @ingress_route_table
        value.validate!
      end

      if value = @internet_gateway
        value.validate!
      end

      if value = @load_balancer_arn
        raise Core::ValidationError.new("LoadBalancerArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("LoadBalancerArn length must be <= 1283") if value.size > 1283
      end

      if value = @classic_load_balancer_listener
        value.validate!
      end

      if value = @load_balancer_listener_port
        raise Core::ValidationError.new("LoadBalancerListenerPort value must be >= 0") if value < 0
        raise Core::ValidationError.new("LoadBalancerListenerPort value must be <= 65535") if value > 65535
      end

      if value = @load_balancer_target
        value.validate!
      end

      if value = @load_balancer_target_group
        value.validate!
      end

      if value = @load_balancer_target_groups
        value.each(&.validate!)
      end

      if value = @load_balancer_target_port
        raise Core::ValidationError.new("LoadBalancerTargetPort value must be >= 0") if value < 0
        raise Core::ValidationError.new("LoadBalancerTargetPort value must be <= 65535") if value > 65535
      end

      if value = @elastic_load_balancer_listener
        value.validate!
      end

      if value = @nat_gateway
        value.validate!
      end

      if value = @network_interface
        value.validate!
      end

      if value = @vpc_peering_connection
        value.validate!
      end

      if value = @port
        raise Core::ValidationError.new("Port value must be >= 0") if value < 0
        raise Core::ValidationError.new("Port value must be <= 65535") if value > 65535
      end

      if value = @port_ranges
        value.each(&.validate!)
      end

      if value = @prefix_list
        value.validate!
      end

      if value = @route_table_route
        value.validate!
      end

      if value = @route_table
        value.validate!
      end

      if value = @security_group
        value.validate!
      end

      if value = @security_group_rule
        value.validate!
      end

      if value = @security_groups
        value.each(&.validate!)
      end

      if value = @source_vpc
        value.validate!
      end

      if value = @subnet
        value.validate!
      end

      if value = @subnet_route_table
        value.validate!
      end

      if value = @vpc
        value.validate!
      end

      if value = @vpc_endpoint
        value.validate!
      end

      if value = @vpn_connection
        value.validate!
      end

      if value = @vpn_gateway
        value.validate!
      end

      if value = @transit_gateway
        value.validate!
      end

      if value = @transit_gateway_route_table
        value.validate!
      end

      if value = @transit_gateway_route_table_route
        value.validate!
      end

      if value = @transit_gateway_attachment
        value.validate!
      end

      if value = @component_account
        raise Core::ValidationError.new("ComponentAccount does not match the required pattern") unless value.matches?(Regex.new("^\\d{12}$"))
      end

      if value = @component_region
        raise Core::ValidationError.new("ComponentRegion does not match the required pattern") unless value.matches?(Regex.new("^[a-z]{2}-[a-z]+-[1-9]+$"))
      end

      if value = @firewall_stateless_rule
        value.validate!
      end

      if value = @firewall_stateful_rule
        value.validate!
      end
    end

    def_equals_and_hash(@acl, @acl_rule, @address, @addresses, @attached_to, @availability_zones, @availability_zone_ids, @cidrs, @component, @customer_gateway, @destination, @destination_vpc, @direction, @explanation_code, @ingress_route_table, @internet_gateway, @load_balancer_arn, @classic_load_balancer_listener, @load_balancer_listener_port, @load_balancer_target, @load_balancer_target_group, @load_balancer_target_groups, @load_balancer_target_port, @elastic_load_balancer_listener, @missing_component, @nat_gateway, @network_interface, @packet_field, @vpc_peering_connection, @port, @port_ranges, @prefix_list, @protocols, @route_table_route, @route_table, @security_group, @security_group_rule, @security_groups, @source_vpc, @state, @subnet, @subnet_route_table, @vpc, @vpc_endpoint, @vpn_connection, @vpn_gateway, @transit_gateway, @transit_gateway_route_table, @transit_gateway_route_table_route, @transit_gateway_attachment, @component_account, @component_region, @firewall_stateless_rule, @firewall_stateful_rule)
  end
end
