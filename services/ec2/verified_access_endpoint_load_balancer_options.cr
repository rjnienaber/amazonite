private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a load balancer when creating an Amazon Web Services Verified Access endpoint using
  # the `load-balancer` type.
  class VerifiedAccessEndpointLoadBalancerOptions
    # The IP protocol.
    property protocol : VerifiedAccessEndpointProtocol | Nil

    # The IP port number.
    property port : Int32 | Nil

    # The ARN of the load balancer.
    property load_balancer_arn : String | Nil

    # The IDs of the subnets.
    property subnet_ids : Array(String) | Nil

    # The port ranges.
    property port_ranges : Array(VerifiedAccessEndpointPortRange) | Nil

    def initialize(
      @protocol : VerifiedAccessEndpointProtocol | Nil = nil,
      @port : Int32 | Nil = nil,
      @load_balancer_arn : String | Nil = nil,
      @subnet_ids : Array(String) | Nil = nil,
      @port_ranges : Array(VerifiedAccessEndpointPortRange) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @protocol
        params << {"#{prefix}Protocol", value.to_json_object_key}
      end

      if value = @port
        params << {"#{prefix}Port", value.to_s}
      end

      if value = @load_balancer_arn
        params << {"#{prefix}LoadBalancerArn", value}
      end

      (@subnet_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SubnetIdSet.#{i}", item}
      end

      (@port_ranges || [] of VerifiedAccessEndpointPortRange).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PortRangeSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        protocol: (n = node.xpath_node("*[local-name()='protocol']")) ? AEC::VerifiedAccessEndpointProtocol.from_json_object_key?(n.content) : nil,
        port: Core::XMLValue.i32(node.xpath_node("*[local-name()='port']")),
        load_balancer_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='loadBalancerArn']")),
        subnet_ids: node.xpath_nodes("*[local-name()='subnetIdSet']/*[local-name()='item']").map { |n| n.content },
        port_ranges: node.xpath_nodes("*[local-name()='portRangeSet']/*[local-name()='item']").map { |n| VerifiedAccessEndpointPortRange.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @port
        raise Core::ValidationError.new("Port value must be >= 1") if value < 1
        raise Core::ValidationError.new("Port value must be <= 65535") if value > 65535
      end

      if value = @port_ranges
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@protocol, @port, @load_balancer_arn, @subnet_ids, @port_ranges)
  end
end
