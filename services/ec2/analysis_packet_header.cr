private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a header. Reflects any changes made by a component as traffic passes through. The
  # fields of an inbound header are null except for the first component of a path.
  class AnalysisPacketHeader
    # The destination addresses.
    property destination_addresses : Array(String) | Nil

    # The destination port ranges.
    property destination_port_ranges : Array(PortRange) | Nil

    # The protocol.
    property protocol : String | Nil

    # The source addresses.
    property source_addresses : Array(String) | Nil

    # The source port ranges.
    property source_port_ranges : Array(PortRange) | Nil

    def initialize(
      @destination_addresses : Array(String) | Nil = nil,
      @destination_port_ranges : Array(PortRange) | Nil = nil,
      @protocol : String | Nil = nil,
      @source_addresses : Array(String) | Nil = nil,
      @source_port_ranges : Array(PortRange) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@destination_addresses || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}DestinationAddressSet.#{i}", item}
      end

      (@destination_port_ranges || [] of PortRange).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}DestinationPortRangeSet.#{i}."))
      end

      if value = @protocol
        params << {"#{prefix}Protocol", value}
      end

      (@source_addresses || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SourceAddressSet.#{i}", item}
      end

      (@source_port_ranges || [] of PortRange).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SourcePortRangeSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        destination_addresses: node.xpath_nodes("*[local-name()='destinationAddressSet']/*[local-name()='item']").map { |n| n.content },
        destination_port_ranges: node.xpath_nodes("*[local-name()='destinationPortRangeSet']/*[local-name()='item']").map { |n| PortRange.from_xml(n) },
        protocol: Core::XMLValue.string(node.xpath_node("*[local-name()='protocol']")),
        source_addresses: node.xpath_nodes("*[local-name()='sourceAddressSet']/*[local-name()='item']").map { |n| n.content },
        source_port_ranges: node.xpath_nodes("*[local-name()='sourcePortRangeSet']/*[local-name()='item']").map { |n| PortRange.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @destination_port_ranges
        value.each(&.validate!)
      end

      if value = @source_port_ranges
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@destination_addresses, @destination_port_ranges, @protocol, @source_addresses, @source_port_ranges)
  end
end
