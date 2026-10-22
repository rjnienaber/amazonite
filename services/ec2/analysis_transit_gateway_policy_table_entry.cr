private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an entry in a transit gateway policy table.
  class AnalysisTransitGatewayPolicyTableEntry
    # The rule number for the policy table entry. Entries are evaluated in ascending order of rule
    # number.
    property rule_number : Int32 | Nil

    # The protocol number. A value of `-1` means that the entry matches all protocols.
    property protocol : String | Nil

    # The source CIDR block. If this value is not present, the entry matches any source address.
    property source_cidr : String | Nil

    # The destination CIDR block. If this value is not present, the entry matches any destination
    # address.
    property destination_cidr : String | Nil

    # The source port range. If this value is not present, the entry matches any source port.
    property source_port_range : PortRange | Nil

    # The destination port range. If this value is not present, the entry matches any destination
    # port.
    property destination_port_range : PortRange | Nil

    # The ID of the transit gateway route table to which the entry routes matching traffic.
    property target_route_table_id : String | Nil

    def initialize(
      @rule_number : Int32 | Nil = nil,
      @protocol : String | Nil = nil,
      @source_cidr : String | Nil = nil,
      @destination_cidr : String | Nil = nil,
      @source_port_range : PortRange | Nil = nil,
      @destination_port_range : PortRange | Nil = nil,
      @target_route_table_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @rule_number
        params << {"#{prefix}RuleNumber", value.to_s}
      end

      if value = @protocol
        params << {"#{prefix}Protocol", value}
      end

      if value = @source_cidr
        params << {"#{prefix}SourceCidr", value}
      end

      if value = @destination_cidr
        params << {"#{prefix}DestinationCidr", value}
      end

      if value = @source_port_range
        params.concat(value.to_query_params("#{prefix}SourcePortRange."))
      end

      if value = @destination_port_range
        params.concat(value.to_query_params("#{prefix}DestinationPortRange."))
      end

      if value = @target_route_table_id
        params << {"#{prefix}TargetRouteTableId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        rule_number: Core::XMLValue.i32(node.xpath_node("*[local-name()='ruleNumber']")),
        protocol: Core::XMLValue.string(node.xpath_node("*[local-name()='protocol']")),
        source_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='sourceCidr']")),
        destination_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='destinationCidr']")),
        source_port_range: node.xpath_node("*[local-name()='sourcePortRange']").try { |n| PortRange.from_xml(n) },
        destination_port_range: node.xpath_node("*[local-name()='destinationPortRange']").try { |n| PortRange.from_xml(n) },
        target_route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='targetRouteTableId']")),
      )
    end

    def validate! : Nil
      if value = @source_port_range
        value.validate!
      end

      if value = @destination_port_range
        value.validate!
      end
    end

    def_equals_and_hash(@rule_number, @protocol, @source_cidr, @destination_cidr, @source_port_range, @destination_port_range, @target_route_table_id)
  end
end
