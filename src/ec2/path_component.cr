private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a path component.
  class PathComponent
    # The sequence number.
    property sequence_number : Int32 | Nil

    # The network ACL rule.
    property acl_rule : AnalysisAclRule | Nil

    # The resource to which the path component is attached.
    property attached_to : AnalysisComponent | Nil

    # The component.
    property component : AnalysisComponent | Nil

    # The destination VPC.
    property destination_vpc : AnalysisComponent | Nil

    # The outbound header.
    property outbound_header : AnalysisPacketHeader | Nil

    # The inbound header.
    property inbound_header : AnalysisPacketHeader | Nil

    # The route table route.
    property route_table_route : AnalysisRouteTableRoute | Nil

    # The security group rule.
    property security_group_rule : AnalysisSecurityGroupRule | Nil

    # The source VPC.
    property source_vpc : AnalysisComponent | Nil

    # The subnet.
    property subnet : AnalysisComponent | Nil

    # The component VPC.
    property vpc : AnalysisComponent | Nil

    # The additional details.
    property additional_details : Array(AdditionalDetail) | Nil

    # The transit gateway.
    property transit_gateway : AnalysisComponent | Nil

    # The route in a transit gateway route table.
    property transit_gateway_route_table_route : TransitGatewayRouteTableRoute | Nil

    # The explanation codes.
    property explanations : Array(Explanation) | Nil

    # The load balancer listener.
    property elastic_load_balancer_listener : AnalysisComponent | Nil

    # The Network Firewall stateless rule.
    property firewall_stateless_rule : FirewallStatelessRule | Nil

    # The Network Firewall stateful rule.
    property firewall_stateful_rule : FirewallStatefulRule | Nil

    # The name of the VPC endpoint service.
    property service_name : String | Nil

    def initialize(
      @sequence_number : Int32 | Nil = nil,
      @acl_rule : AnalysisAclRule | Nil = nil,
      @attached_to : AnalysisComponent | Nil = nil,
      @component : AnalysisComponent | Nil = nil,
      @destination_vpc : AnalysisComponent | Nil = nil,
      @outbound_header : AnalysisPacketHeader | Nil = nil,
      @inbound_header : AnalysisPacketHeader | Nil = nil,
      @route_table_route : AnalysisRouteTableRoute | Nil = nil,
      @security_group_rule : AnalysisSecurityGroupRule | Nil = nil,
      @source_vpc : AnalysisComponent | Nil = nil,
      @subnet : AnalysisComponent | Nil = nil,
      @vpc : AnalysisComponent | Nil = nil,
      @additional_details : Array(AdditionalDetail) | Nil = nil,
      @transit_gateway : AnalysisComponent | Nil = nil,
      @transit_gateway_route_table_route : TransitGatewayRouteTableRoute | Nil = nil,
      @explanations : Array(Explanation) | Nil = nil,
      @elastic_load_balancer_listener : AnalysisComponent | Nil = nil,
      @firewall_stateless_rule : FirewallStatelessRule | Nil = nil,
      @firewall_stateful_rule : FirewallStatefulRule | Nil = nil,
      @service_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @sequence_number
        params << {"#{prefix}SequenceNumber", value.to_s}
      end

      if value = @acl_rule
        params.concat(value.to_query_params("#{prefix}AclRule."))
      end

      if value = @attached_to
        params.concat(value.to_query_params("#{prefix}AttachedTo."))
      end

      if value = @component
        params.concat(value.to_query_params("#{prefix}Component."))
      end

      if value = @destination_vpc
        params.concat(value.to_query_params("#{prefix}DestinationVpc."))
      end

      if value = @outbound_header
        params.concat(value.to_query_params("#{prefix}OutboundHeader."))
      end

      if value = @inbound_header
        params.concat(value.to_query_params("#{prefix}InboundHeader."))
      end

      if value = @route_table_route
        params.concat(value.to_query_params("#{prefix}RouteTableRoute."))
      end

      if value = @security_group_rule
        params.concat(value.to_query_params("#{prefix}SecurityGroupRule."))
      end

      if value = @source_vpc
        params.concat(value.to_query_params("#{prefix}SourceVpc."))
      end

      if value = @subnet
        params.concat(value.to_query_params("#{prefix}Subnet."))
      end

      if value = @vpc
        params.concat(value.to_query_params("#{prefix}Vpc."))
      end

      (@additional_details || [] of AdditionalDetail).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AdditionalDetailSet.#{i}."))
      end

      if value = @transit_gateway
        params.concat(value.to_query_params("#{prefix}TransitGateway."))
      end

      if value = @transit_gateway_route_table_route
        params.concat(value.to_query_params("#{prefix}TransitGatewayRouteTableRoute."))
      end

      (@explanations || [] of Explanation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ExplanationSet.#{i}."))
      end

      if value = @elastic_load_balancer_listener
        params.concat(value.to_query_params("#{prefix}ElasticLoadBalancerListener."))
      end

      if value = @firewall_stateless_rule
        params.concat(value.to_query_params("#{prefix}FirewallStatelessRule."))
      end

      if value = @firewall_stateful_rule
        params.concat(value.to_query_params("#{prefix}FirewallStatefulRule."))
      end

      if value = @service_name
        params << {"#{prefix}ServiceName", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        sequence_number: Core::XMLValue.i32(node.xpath_node("*[local-name()='sequenceNumber']")),
        acl_rule: node.xpath_node("*[local-name()='aclRule']").try { |n| AnalysisAclRule.from_xml(n) },
        attached_to: node.xpath_node("*[local-name()='attachedTo']").try { |n| AnalysisComponent.from_xml(n) },
        component: node.xpath_node("*[local-name()='component']").try { |n| AnalysisComponent.from_xml(n) },
        destination_vpc: node.xpath_node("*[local-name()='destinationVpc']").try { |n| AnalysisComponent.from_xml(n) },
        outbound_header: node.xpath_node("*[local-name()='outboundHeader']").try { |n| AnalysisPacketHeader.from_xml(n) },
        inbound_header: node.xpath_node("*[local-name()='inboundHeader']").try { |n| AnalysisPacketHeader.from_xml(n) },
        route_table_route: node.xpath_node("*[local-name()='routeTableRoute']").try { |n| AnalysisRouteTableRoute.from_xml(n) },
        security_group_rule: node.xpath_node("*[local-name()='securityGroupRule']").try { |n| AnalysisSecurityGroupRule.from_xml(n) },
        source_vpc: node.xpath_node("*[local-name()='sourceVpc']").try { |n| AnalysisComponent.from_xml(n) },
        subnet: node.xpath_node("*[local-name()='subnet']").try { |n| AnalysisComponent.from_xml(n) },
        vpc: node.xpath_node("*[local-name()='vpc']").try { |n| AnalysisComponent.from_xml(n) },
        additional_details: node.xpath_nodes("*[local-name()='additionalDetailSet']/*[local-name()='item']").map { |n| AdditionalDetail.from_xml(n) },
        transit_gateway: node.xpath_node("*[local-name()='transitGateway']").try { |n| AnalysisComponent.from_xml(n) },
        transit_gateway_route_table_route: node.xpath_node("*[local-name()='transitGatewayRouteTableRoute']").try { |n| TransitGatewayRouteTableRoute.from_xml(n) },
        explanations: node.xpath_nodes("*[local-name()='explanationSet']/*[local-name()='item']").map { |n| Explanation.from_xml(n) },
        elastic_load_balancer_listener: node.xpath_node("*[local-name()='elasticLoadBalancerListener']").try { |n| AnalysisComponent.from_xml(n) },
        firewall_stateless_rule: node.xpath_node("*[local-name()='firewallStatelessRule']").try { |n| FirewallStatelessRule.from_xml(n) },
        firewall_stateful_rule: node.xpath_node("*[local-name()='firewallStatefulRule']").try { |n| FirewallStatefulRule.from_xml(n) },
        service_name: Core::XMLValue.string(node.xpath_node("*[local-name()='serviceName']")),
      )
    end

    def validate! : Nil
      if value = @acl_rule
        value.validate!
      end

      if value = @attached_to
        value.validate!
      end

      if value = @component
        value.validate!
      end

      if value = @destination_vpc
        value.validate!
      end

      if value = @outbound_header
        value.validate!
      end

      if value = @inbound_header
        value.validate!
      end

      if value = @route_table_route
        value.validate!
      end

      if value = @security_group_rule
        value.validate!
      end

      if value = @source_vpc
        value.validate!
      end

      if value = @subnet
        value.validate!
      end

      if value = @vpc
        value.validate!
      end

      if value = @additional_details
        value.each(&.validate!)
      end

      if value = @transit_gateway
        value.validate!
      end

      if value = @transit_gateway_route_table_route
        value.validate!
      end

      if value = @explanations
        value.each(&.validate!)
      end

      if value = @elastic_load_balancer_listener
        value.validate!
      end

      if value = @firewall_stateless_rule
        value.validate!
      end

      if value = @firewall_stateful_rule
        value.validate!
      end
    end

    def_equals_and_hash(@sequence_number, @acl_rule, @attached_to, @component, @destination_vpc, @outbound_header, @inbound_header, @route_table_route, @security_group_rule, @source_vpc, @subnet, @vpc, @additional_details, @transit_gateway, @transit_gateway_route_table_route, @explanations, @elastic_load_balancer_listener, @firewall_stateless_rule, @firewall_stateful_rule, @service_name)
  end
end
