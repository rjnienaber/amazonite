private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the CIDR options for a Verified Access endpoint.
  class VerifiedAccessEndpointCidrOptions
    # The CIDR.
    property cidr : String | Nil

    # The port ranges.
    property port_ranges : Array(VerifiedAccessEndpointPortRange) | Nil

    # The protocol.
    property protocol : VerifiedAccessEndpointProtocol | Nil

    # The IDs of the subnets.
    property subnet_ids : Array(String) | Nil

    def initialize(
      @cidr : String | Nil = nil,
      @port_ranges : Array(VerifiedAccessEndpointPortRange) | Nil = nil,
      @protocol : VerifiedAccessEndpointProtocol | Nil = nil,
      @subnet_ids : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @cidr
        params << {"#{prefix}Cidr", value}
      end

      (@port_ranges || [] of VerifiedAccessEndpointPortRange).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PortRangeSet.#{i}."))
      end

      if value = @protocol
        params << {"#{prefix}Protocol", value.to_json_object_key}
      end

      (@subnet_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SubnetIdSet.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='cidr']")),
        port_ranges: node.xpath_nodes("*[local-name()='portRangeSet']/*[local-name()='item']").map { |n| VerifiedAccessEndpointPortRange.from_xml(n) },
        protocol: (n = node.xpath_node("*[local-name()='protocol']")) ? AEC::VerifiedAccessEndpointProtocol.from_json_object_key?(n.content) : nil,
        subnet_ids: node.xpath_nodes("*[local-name()='subnetIdSet']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
      if value = @port_ranges
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@cidr, @port_ranges, @protocol, @subnet_ids)
  end
end
