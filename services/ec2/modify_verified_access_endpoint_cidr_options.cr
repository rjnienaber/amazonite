private alias Core = Amazonite::Core

module Amazonite::EC2
  # The CIDR options for a Verified Access endpoint.
  class ModifyVerifiedAccessEndpointCidrOptions
    # The port ranges.
    property port_ranges : Array(ModifyVerifiedAccessEndpointPortRange) | Nil

    def initialize(
      @port_ranges : Array(ModifyVerifiedAccessEndpointPortRange) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@port_ranges || [] of ModifyVerifiedAccessEndpointPortRange).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PortRange.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        port_ranges: node.xpath_nodes("*[local-name()='PortRange']/*[local-name()='item']").map { |n| ModifyVerifiedAccessEndpointPortRange.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @port_ranges
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@port_ranges)
  end
end
