private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a stateless rule.
  class FirewallStatelessRule
    # The ARN of the stateless rule group.
    property rule_group_arn : String | Nil

    # The source IP addresses, in CIDR notation.
    property sources : Array(String) | Nil

    # The destination IP addresses, in CIDR notation.
    property destinations : Array(String) | Nil

    # The source ports.
    property source_ports : Array(PortRange) | Nil

    # The destination ports.
    property destination_ports : Array(PortRange) | Nil

    # The protocols.
    property protocols : Array(Int32) | Nil

    # The rule action. The possible values are `pass`, `drop`, and `forward_to_site`.
    property rule_action : String | Nil

    # The rule priority.
    property priority : Int32 | Nil

    def initialize(
      @rule_group_arn : String | Nil = nil,
      @sources : Array(String) | Nil = nil,
      @destinations : Array(String) | Nil = nil,
      @source_ports : Array(PortRange) | Nil = nil,
      @destination_ports : Array(PortRange) | Nil = nil,
      @protocols : Array(Int32) | Nil = nil,
      @rule_action : String | Nil = nil,
      @priority : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @rule_group_arn
        params << {"#{prefix}RuleGroupArn", value}
      end

      (@sources || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SourceSet.#{i}", item}
      end

      (@destinations || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}DestinationSet.#{i}", item}
      end

      (@source_ports || [] of PortRange).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SourcePortSet.#{i}."))
      end

      (@destination_ports || [] of PortRange).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}DestinationPortSet.#{i}."))
      end

      (@protocols || [] of Int32).each_with_index(1) do |item, i|
        params << {"#{prefix}ProtocolSet.#{i}", item.to_s}
      end

      if value = @rule_action
        params << {"#{prefix}RuleAction", value}
      end

      if value = @priority
        params << {"#{prefix}Priority", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        rule_group_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ruleGroupArn']")),
        sources: node.xpath_nodes("*[local-name()='sourceSet']/*[local-name()='item']").map { |n| n.content },
        destinations: node.xpath_nodes("*[local-name()='destinationSet']/*[local-name()='item']").map { |n| n.content },
        source_ports: node.xpath_nodes("*[local-name()='sourcePortSet']/*[local-name()='item']").map { |n| PortRange.from_xml(n) },
        destination_ports: node.xpath_nodes("*[local-name()='destinationPortSet']/*[local-name()='item']").map { |n| PortRange.from_xml(n) },
        protocols: node.xpath_nodes("*[local-name()='protocolSet']/*[local-name()='item']").map { |n| n.content.to_i32 },
        rule_action: Core::XMLValue.string(node.xpath_node("*[local-name()='ruleAction']")),
        priority: Core::XMLValue.i32(node.xpath_node("*[local-name()='priority']")),
      )
    end

    def validate! : Nil
      if value = @rule_group_arn
        raise Core::ValidationError.new("RuleGroupArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RuleGroupArn length must be <= 1283") if value.size > 1283
      end

      if value = @source_ports
        value.each(&.validate!)
      end

      if value = @destination_ports
        value.each(&.validate!)
      end

      if value = @priority
        raise Core::ValidationError.new("Priority value must be >= -1") if value < -1
        raise Core::ValidationError.new("Priority value must be <= 65535") if value > 65535
      end
    end

    def_equals_and_hash(@rule_group_arn, @sources, @destinations, @source_ports, @destination_ports, @protocols, @rule_action, @priority)
  end
end
