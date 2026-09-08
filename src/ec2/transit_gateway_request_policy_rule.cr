private alias Core = Amazonite::Core

module Amazonite::EC2
  # The matching criteria for a transit gateway policy table entry.
  class TransitGatewayRequestPolicyRule
    # The source CIDR block for the policy rule.
    property source_cidr_block : String | Nil

    # The source port or port range for the policy rule. You can specify a port range only when
    # `Protocol` is `6` (TCP) or `17` (UDP); for all other protocols, this value must be `*`.
    property source_port_range : String | Nil

    # The destination CIDR block for the policy rule.
    property destination_cidr_block : String | Nil

    # The destination port or port range for the policy rule. You can specify a port range only when
    # `Protocol` is `6` (TCP) or `17` (UDP); for all other protocols, this value must be `*`.
    property destination_port_range : String | Nil

    # The protocol for the policy rule. Valid values are `1` (ICMP), `6` (TCP), `17` (UDP), `47`
    # (GRE), or `*` for all protocols.
    property protocol : String | Nil

    # The metadata key-value pair for the policy rule.
    property meta_data : TransitGatewayRequestPolicyRuleMetaData | Nil

    def initialize(
      @source_cidr_block : String | Nil = nil,
      @source_port_range : String | Nil = nil,
      @destination_cidr_block : String | Nil = nil,
      @destination_port_range : String | Nil = nil,
      @protocol : String | Nil = nil,
      @meta_data : TransitGatewayRequestPolicyRuleMetaData | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @source_cidr_block
        params << {"#{prefix}SourceCidrBlock", value}
      end

      if value = @source_port_range
        params << {"#{prefix}SourcePortRange", value}
      end

      if value = @destination_cidr_block
        params << {"#{prefix}DestinationCidrBlock", value}
      end

      if value = @destination_port_range
        params << {"#{prefix}DestinationPortRange", value}
      end

      if value = @protocol
        params << {"#{prefix}Protocol", value}
      end

      if value = @meta_data
        params.concat(value.to_query_params("#{prefix}MetaData."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        source_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceCidrBlock']")),
        source_port_range: Core::XMLValue.string(node.xpath_node("*[local-name()='SourcePortRange']")),
        destination_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='DestinationCidrBlock']")),
        destination_port_range: Core::XMLValue.string(node.xpath_node("*[local-name()='DestinationPortRange']")),
        protocol: Core::XMLValue.string(node.xpath_node("*[local-name()='Protocol']")),
        meta_data: node.xpath_node("*[local-name()='MetaData']").try { |n| TransitGatewayRequestPolicyRuleMetaData.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @meta_data
        value.validate!
      end
    end

    def_equals_and_hash(@source_cidr_block, @source_port_range, @destination_cidr_block, @destination_port_range, @protocol, @meta_data)
  end
end
