private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a packet header statement.
  class PacketHeaderStatementRequest
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
        params << {"#{prefix}SourceAddress.#{i}", item}
      end

      (@destination_addresses || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}DestinationAddress.#{i}", item}
      end

      (@source_ports || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SourcePort.#{i}", item}
      end

      (@destination_ports || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}DestinationPort.#{i}", item}
      end

      (@source_prefix_lists || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SourcePrefixList.#{i}", item}
      end

      (@destination_prefix_lists || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}DestinationPrefixList.#{i}", item}
      end

      (@protocols || [] of Protocol).each_with_index(1) do |item, i|
        params << {"#{prefix}Protocol.#{i}", item.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        source_addresses: node.xpath_nodes("*[local-name()='SourceAddress']/*[local-name()='item']").map { |n| n.content },
        destination_addresses: node.xpath_nodes("*[local-name()='DestinationAddress']/*[local-name()='item']").map { |n| n.content },
        source_ports: node.xpath_nodes("*[local-name()='SourcePort']/*[local-name()='item']").map { |n| n.content },
        destination_ports: node.xpath_nodes("*[local-name()='DestinationPort']/*[local-name()='item']").map { |n| n.content },
        source_prefix_lists: node.xpath_nodes("*[local-name()='SourcePrefixList']/*[local-name()='item']").map { |n| n.content },
        destination_prefix_lists: node.xpath_nodes("*[local-name()='DestinationPrefixList']/*[local-name()='item']").map { |n| n.content },
        protocols: node.xpath_nodes("*[local-name()='Protocol']/*[local-name()='item']").compact_map { |n| AEC::Protocol.from_json_object_key?(n.content) },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@source_addresses, @destination_addresses, @source_ports, @destination_ports, @source_prefix_lists, @destination_prefix_lists, @protocols)
  end
end
