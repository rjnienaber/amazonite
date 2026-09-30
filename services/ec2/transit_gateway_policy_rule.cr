private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a rule associated with a transit gateway policy.
  class TransitGatewayPolicyRule
    # The source CIDR block for the transit gateway policy rule.
    property source_cidr_block : String | Nil

    # The source port or port range for the transit gateway policy rule.
    property source_port_range : String | Nil

    # The destination CIDR block for the transit gateway policy rule.
    property destination_cidr_block : String | Nil

    # The destination port or port range for the transit gateway policy rule.
    property destination_port_range : String | Nil

    # The protocol used by the transit gateway policy rule.
    property protocol : String | Nil

    # The meta data tags used for the transit gateway policy rule.
    property meta_data : TransitGatewayPolicyRuleMetaData | Nil

    def initialize(
      @source_cidr_block : String | Nil = nil,
      @source_port_range : String | Nil = nil,
      @destination_cidr_block : String | Nil = nil,
      @destination_port_range : String | Nil = nil,
      @protocol : String | Nil = nil,
      @meta_data : TransitGatewayPolicyRuleMetaData | Nil = nil,
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
        source_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='sourceCidrBlock']")),
        source_port_range: Core::XMLValue.string(node.xpath_node("*[local-name()='sourcePortRange']")),
        destination_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='destinationCidrBlock']")),
        destination_port_range: Core::XMLValue.string(node.xpath_node("*[local-name()='destinationPortRange']")),
        protocol: Core::XMLValue.string(node.xpath_node("*[local-name()='protocol']")),
        meta_data: node.xpath_node("*[local-name()='metaData']").try { |n| TransitGatewayPolicyRuleMetaData.from_xml(n) },
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
