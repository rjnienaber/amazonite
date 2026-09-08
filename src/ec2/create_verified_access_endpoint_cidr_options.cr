private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the CIDR options for a Verified Access endpoint.
  class CreateVerifiedAccessEndpointCidrOptions
    # The protocol.
    property protocol : VerifiedAccessEndpointProtocol | Nil

    # The IDs of the subnets.
    property subnet_ids : Array(String) | Nil

    # The CIDR.
    property cidr : String | Nil

    # The port ranges.
    property port_ranges : Array(CreateVerifiedAccessEndpointPortRange) | Nil

    def initialize(
      @protocol : VerifiedAccessEndpointProtocol | Nil = nil,
      @subnet_ids : Array(String) | Nil = nil,
      @cidr : String | Nil = nil,
      @port_ranges : Array(CreateVerifiedAccessEndpointPortRange) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @protocol
        params << {"#{prefix}Protocol", value.to_json_object_key}
      end

      (@subnet_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SubnetId.#{i}", item}
      end

      if value = @cidr
        params << {"#{prefix}Cidr", value}
      end

      (@port_ranges || [] of CreateVerifiedAccessEndpointPortRange).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PortRange.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        protocol: (n = node.xpath_node("*[local-name()='Protocol']")) ? AEC::VerifiedAccessEndpointProtocol.from_json_object_key?(n.content) : nil,
        subnet_ids: node.xpath_nodes("*[local-name()='SubnetId']/*[local-name()='item']").map { |n| n.content },
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='Cidr']")),
        port_ranges: node.xpath_nodes("*[local-name()='PortRange']/*[local-name()='item']").map { |n| CreateVerifiedAccessEndpointPortRange.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @port_ranges
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@protocol, @subnet_ids, @cidr, @port_ranges)
  end
end
