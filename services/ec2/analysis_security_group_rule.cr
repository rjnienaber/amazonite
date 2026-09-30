private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a security group rule.
  class AnalysisSecurityGroupRule
    # The IPv4 address range, in CIDR notation.
    property cidr : String | Nil

    # The direction. The following are the possible values:
    #
    # - egress
    #
    # - ingress
    property direction : String | Nil

    # The security group ID.
    property security_group_id : String | Nil

    # The port range.
    property port_range : PortRange | Nil

    # The prefix list ID.
    property prefix_list_id : String | Nil

    # The protocol name.
    property protocol : String | Nil

    def initialize(
      @cidr : String | Nil = nil,
      @direction : String | Nil = nil,
      @security_group_id : String | Nil = nil,
      @port_range : PortRange | Nil = nil,
      @prefix_list_id : String | Nil = nil,
      @protocol : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @cidr
        params << {"#{prefix}Cidr", value}
      end

      if value = @direction
        params << {"#{prefix}Direction", value}
      end

      if value = @security_group_id
        params << {"#{prefix}SecurityGroupId", value}
      end

      if value = @port_range
        params.concat(value.to_query_params("#{prefix}PortRange."))
      end

      if value = @prefix_list_id
        params << {"#{prefix}PrefixListId", value}
      end

      if value = @protocol
        params << {"#{prefix}Protocol", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='cidr']")),
        direction: Core::XMLValue.string(node.xpath_node("*[local-name()='direction']")),
        security_group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='securityGroupId']")),
        port_range: node.xpath_node("*[local-name()='portRange']").try { |n| PortRange.from_xml(n) },
        prefix_list_id: Core::XMLValue.string(node.xpath_node("*[local-name()='prefixListId']")),
        protocol: Core::XMLValue.string(node.xpath_node("*[local-name()='protocol']")),
      )
    end

    def validate! : Nil
      if value = @port_range
        value.validate!
      end
    end

    def_equals_and_hash(@cidr, @direction, @security_group_id, @port_range, @prefix_list_id, @protocol)
  end
end
