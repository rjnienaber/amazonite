private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a packet header statement.
  class PacketHeaderStatement
    # The source addresses.
    property source_addresses : Array(String) | Nil

    # The destination addresses.
    property destination_addresses : Array(String) | Nil

    # The source ports.
    property source_ports : Array(String) | Nil

    # The destination ports.
    property destination_ports : Array(String) | Nil

    # The source prefix lists.
    property source_prefix_lists : Array(String) | Nil

    # The destination prefix lists.
    property destination_prefix_lists : Array(String) | Nil

    # The protocols.
    property protocols : Array(Protocol) | Nil

    def initialize(
      @source_addresses : Array(String) | Nil = nil,
      @destination_addresses : Array(String) | Nil = nil,
      @source_ports : Array(String) | Nil = nil,
      @destination_ports : Array(String) | Nil = nil,
      @source_prefix_lists : Array(String) | Nil = nil,
      @destination_prefix_lists : Array(String) | Nil = nil,
      @protocols : Array(Protocol) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@source_addresses || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SourceAddressSet.#{i}", item}
      end

      (@destination_addresses || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}DestinationAddressSet.#{i}", item}
      end

      (@source_ports || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SourcePortSet.#{i}", item}
      end

      (@destination_ports || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}DestinationPortSet.#{i}", item}
      end

      (@source_prefix_lists || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SourcePrefixListSet.#{i}", item}
      end

      (@destination_prefix_lists || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}DestinationPrefixListSet.#{i}", item}
      end

      (@protocols || [] of Protocol).each_with_index(1) do |item, i|
        params << {"#{prefix}ProtocolSet.#{i}", item.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        source_addresses: node.xpath_nodes("*[local-name()='sourceAddressSet']/*[local-name()='item']").map { |n| n.content },
        destination_addresses: node.xpath_nodes("*[local-name()='destinationAddressSet']/*[local-name()='item']").map { |n| n.content },
        source_ports: node.xpath_nodes("*[local-name()='sourcePortSet']/*[local-name()='item']").map { |n| n.content },
        destination_ports: node.xpath_nodes("*[local-name()='destinationPortSet']/*[local-name()='item']").map { |n| n.content },
        source_prefix_lists: node.xpath_nodes("*[local-name()='sourcePrefixListSet']/*[local-name()='item']").map { |n| n.content },
        destination_prefix_lists: node.xpath_nodes("*[local-name()='destinationPrefixListSet']/*[local-name()='item']").map { |n| n.content },
        protocols: node.xpath_nodes("*[local-name()='protocolSet']/*[local-name()='item']").compact_map { |n| AEC::Protocol.from_json_object_key?(n.content) },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@source_addresses, @destination_addresses, @source_ports, @destination_ports, @source_prefix_lists, @destination_prefix_lists, @protocols)
  end
end
