private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a VPC endpoint connection to a service.
  class VpcEndpointConnection
    # The ID of the service to which the endpoint is connected.
    property service_id : String | Nil

    # The ID of the VPC endpoint.
    property vpc_endpoint_id : String | Nil

    # The ID of the Amazon Web Services account that owns the VPC endpoint.
    property vpc_endpoint_owner : String | Nil

    # The state of the VPC endpoint.
    property vpc_endpoint_state : State | Nil

    # The date and time that the VPC endpoint was created.
    property creation_timestamp : Time | Nil

    # The DNS entries for the VPC endpoint.
    property dns_entries : Array(DnsEntry) | Nil

    # The Amazon Resource Names (ARNs) of the network load balancers for the service.
    property network_load_balancer_arns : Array(String) | Nil

    # The Amazon Resource Names (ARNs) of the Gateway Load Balancers for the service.
    property gateway_load_balancer_arns : Array(String) | Nil

    # The IP address type for the endpoint.
    property ip_address_type : IpAddressType | Nil

    # The ID of the VPC endpoint connection.
    property vpc_endpoint_connection_id : String | Nil

    # The tags.
    property tags : Array(Tag) | Nil

    # The Region of the endpoint.
    property vpc_endpoint_region : String | Nil

    # The payer responsibility settings for the endpoint.
    property payer_responsibilities : Array(PayerResponsibilityEntry) | Nil

    def initialize(
      @service_id : String | Nil = nil,
      @vpc_endpoint_id : String | Nil = nil,
      @vpc_endpoint_owner : String | Nil = nil,
      @vpc_endpoint_state : State | Nil = nil,
      @creation_timestamp : Time | Nil = nil,
      @dns_entries : Array(DnsEntry) | Nil = nil,
      @network_load_balancer_arns : Array(String) | Nil = nil,
      @gateway_load_balancer_arns : Array(String) | Nil = nil,
      @ip_address_type : IpAddressType | Nil = nil,
      @vpc_endpoint_connection_id : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @vpc_endpoint_region : String | Nil = nil,
      @payer_responsibilities : Array(PayerResponsibilityEntry) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @service_id
        params << {"#{prefix}ServiceId", value}
      end

      if value = @vpc_endpoint_id
        params << {"#{prefix}VpcEndpointId", value}
      end

      if value = @vpc_endpoint_owner
        params << {"#{prefix}VpcEndpointOwner", value}
      end

      if value = @vpc_endpoint_state
        params << {"#{prefix}VpcEndpointState", value.to_json_object_key}
      end

      if value = @creation_timestamp
        params << {"#{prefix}CreationTimestamp", Core::QueryValue.time(value)}
      end

      (@dns_entries || [] of DnsEntry).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}DnsEntrySet.#{i}."))
      end

      (@network_load_balancer_arns || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}NetworkLoadBalancerArnSet.#{i}", item}
      end

      (@gateway_load_balancer_arns || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}GatewayLoadBalancerArnSet.#{i}", item}
      end

      if value = @ip_address_type
        params << {"#{prefix}IpAddressType", value.to_json_object_key}
      end

      if value = @vpc_endpoint_connection_id
        params << {"#{prefix}VpcEndpointConnectionId", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @vpc_endpoint_region
        params << {"#{prefix}VpcEndpointRegion", value}
      end

      (@payer_responsibilities || [] of PayerResponsibilityEntry).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PayerResponsibilitySet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        service_id: Core::XMLValue.string(node.xpath_node("*[local-name()='serviceId']")),
        vpc_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcEndpointId']")),
        vpc_endpoint_owner: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcEndpointOwner']")),
        vpc_endpoint_state: (n = node.xpath_node("*[local-name()='vpcEndpointState']")) ? AEC::State.from_json_object_key?(n.content) : nil,
        creation_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='creationTimestamp']")),
        dns_entries: node.xpath_nodes("*[local-name()='dnsEntrySet']/*[local-name()='item']").map { |n| DnsEntry.from_xml(n) },
        network_load_balancer_arns: node.xpath_nodes("*[local-name()='networkLoadBalancerArnSet']/*[local-name()='item']").map { |n| n.content },
        gateway_load_balancer_arns: node.xpath_nodes("*[local-name()='gatewayLoadBalancerArnSet']/*[local-name()='item']").map { |n| n.content },
        ip_address_type: (n = node.xpath_node("*[local-name()='ipAddressType']")) ? AEC::IpAddressType.from_json_object_key?(n.content) : nil,
        vpc_endpoint_connection_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcEndpointConnectionId']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        vpc_endpoint_region: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcEndpointRegion']")),
        payer_responsibilities: node.xpath_nodes("*[local-name()='payerResponsibilitySet']/*[local-name()='item']").map { |n| PayerResponsibilityEntry.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @dns_entries
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end

      if value = @payer_responsibilities
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@service_id, @vpc_endpoint_id, @vpc_endpoint_owner, @vpc_endpoint_state, @creation_timestamp, @dns_entries, @network_load_balancer_arns, @gateway_load_balancer_arns, @ip_address_type, @vpc_endpoint_connection_id, @tags, @vpc_endpoint_region, @payer_responsibilities)
  end
end
