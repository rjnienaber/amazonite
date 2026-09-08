private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the Traffic Mirror rule.
  class TrafficMirrorFilterRule
    # The ID of the Traffic Mirror rule.
    property traffic_mirror_filter_rule_id : String | Nil

    # The ID of the Traffic Mirror filter that the rule is associated with.
    property traffic_mirror_filter_id : String | Nil

    # The traffic direction assigned to the Traffic Mirror rule.
    property traffic_direction : TrafficDirection | Nil

    # The rule number of the Traffic Mirror rule.
    property rule_number : Int32 | Nil

    # The action assigned to the Traffic Mirror rule.
    property rule_action : TrafficMirrorRuleAction | Nil

    # The protocol assigned to the Traffic Mirror rule.
    property protocol : Int32 | Nil

    # The destination port range assigned to the Traffic Mirror rule.
    property destination_port_range : TrafficMirrorPortRange | Nil

    # The source port range assigned to the Traffic Mirror rule.
    property source_port_range : TrafficMirrorPortRange | Nil

    # The destination CIDR block assigned to the Traffic Mirror rule.
    property destination_cidr_block : String | Nil

    # The source CIDR block assigned to the Traffic Mirror rule.
    property source_cidr_block : String | Nil

    # The description of the Traffic Mirror rule.
    property description : String | Nil

    # Tags on Traffic Mirroring filter rules.
    property tags : Array(Tag) | Nil

    def initialize(
      @traffic_mirror_filter_rule_id : String | Nil = nil,
      @traffic_mirror_filter_id : String | Nil = nil,
      @traffic_direction : TrafficDirection | Nil = nil,
      @rule_number : Int32 | Nil = nil,
      @rule_action : TrafficMirrorRuleAction | Nil = nil,
      @protocol : Int32 | Nil = nil,
      @destination_port_range : TrafficMirrorPortRange | Nil = nil,
      @source_port_range : TrafficMirrorPortRange | Nil = nil,
      @destination_cidr_block : String | Nil = nil,
      @source_cidr_block : String | Nil = nil,
      @description : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @traffic_mirror_filter_rule_id
        params << {"#{prefix}TrafficMirrorFilterRuleId", value}
      end

      if value = @traffic_mirror_filter_id
        params << {"#{prefix}TrafficMirrorFilterId", value}
      end

      if value = @traffic_direction
        params << {"#{prefix}TrafficDirection", value.to_json_object_key}
      end

      if value = @rule_number
        params << {"#{prefix}RuleNumber", value.to_s}
      end

      if value = @rule_action
        params << {"#{prefix}RuleAction", value.to_json_object_key}
      end

      if value = @protocol
        params << {"#{prefix}Protocol", value.to_s}
      end

      if value = @destination_port_range
        params.concat(value.to_query_params("#{prefix}DestinationPortRange."))
      end

      if value = @source_port_range
        params.concat(value.to_query_params("#{prefix}SourcePortRange."))
      end

      if value = @destination_cidr_block
        params << {"#{prefix}DestinationCidrBlock", value}
      end

      if value = @source_cidr_block
        params << {"#{prefix}SourceCidrBlock", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        traffic_mirror_filter_rule_id: Core::XMLValue.string(node.xpath_node("*[local-name()='trafficMirrorFilterRuleId']")),
        traffic_mirror_filter_id: Core::XMLValue.string(node.xpath_node("*[local-name()='trafficMirrorFilterId']")),
        traffic_direction: (n = node.xpath_node("*[local-name()='trafficDirection']")) ? AEC::TrafficDirection.from_json_object_key?(n.content) : nil,
        rule_number: Core::XMLValue.i32(node.xpath_node("*[local-name()='ruleNumber']")),
        rule_action: (n = node.xpath_node("*[local-name()='ruleAction']")) ? AEC::TrafficMirrorRuleAction.from_json_object_key?(n.content) : nil,
        protocol: Core::XMLValue.i32(node.xpath_node("*[local-name()='protocol']")),
        destination_port_range: node.xpath_node("*[local-name()='destinationPortRange']").try { |n| TrafficMirrorPortRange.from_xml(n) },
        source_port_range: node.xpath_node("*[local-name()='sourcePortRange']").try { |n| TrafficMirrorPortRange.from_xml(n) },
        destination_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='destinationCidrBlock']")),
        source_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='sourceCidrBlock']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @destination_port_range
        value.validate!
      end

      if value = @source_port_range
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@traffic_mirror_filter_rule_id, @traffic_mirror_filter_id, @traffic_direction, @rule_number, @rule_action, @protocol, @destination_port_range, @source_port_range, @destination_cidr_block, @source_cidr_block, @description, @tags)
  end
end
