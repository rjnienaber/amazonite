private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyTrafficMirrorFilterRuleRequest
    # The ID of the Traffic Mirror rule.
    property traffic_mirror_filter_rule_id : String

    # The type of traffic to assign to the rule.
    property traffic_direction : TrafficDirection | Nil

    # The number of the Traffic Mirror rule. This number must be unique for each Traffic Mirror rule
    # in a given direction. The rules are processed in ascending order by rule number.
    property rule_number : Int32 | Nil

    # The action to assign to the rule.
    property rule_action : TrafficMirrorRuleAction | Nil

    # The destination ports that are associated with the Traffic Mirror rule.
    property destination_port_range : TrafficMirrorPortRangeRequest | Nil

    # The port range to assign to the Traffic Mirror rule.
    property source_port_range : TrafficMirrorPortRangeRequest | Nil

    # The protocol, for example TCP, to assign to the Traffic Mirror rule.
    property protocol : Int32 | Nil

    # The destination CIDR block to assign to the Traffic Mirror rule.
    property destination_cidr_block : String | Nil

    # The source CIDR block to assign to the Traffic Mirror rule.
    property source_cidr_block : String | Nil

    # The description to assign to the Traffic Mirror rule.
    property description : String | Nil

    # The properties that you want to remove from the Traffic Mirror filter rule.
    #
    # When you remove a property from a Traffic Mirror filter rule, the property is set to the
    # default.
    property remove_fields : Array(TrafficMirrorFilterRuleField) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @traffic_mirror_filter_rule_id : String,
      @traffic_direction : TrafficDirection | Nil = nil,
      @rule_number : Int32 | Nil = nil,
      @rule_action : TrafficMirrorRuleAction | Nil = nil,
      @destination_port_range : TrafficMirrorPortRangeRequest | Nil = nil,
      @source_port_range : TrafficMirrorPortRangeRequest | Nil = nil,
      @protocol : Int32 | Nil = nil,
      @destination_cidr_block : String | Nil = nil,
      @source_cidr_block : String | Nil = nil,
      @description : String | Nil = nil,
      @remove_fields : Array(TrafficMirrorFilterRuleField) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TrafficMirrorFilterRuleId", @traffic_mirror_filter_rule_id}

      if value = @traffic_direction
        params << {"#{prefix}TrafficDirection", value.to_json_object_key}
      end

      if value = @rule_number
        params << {"#{prefix}RuleNumber", value.to_s}
      end

      if value = @rule_action
        params << {"#{prefix}RuleAction", value.to_json_object_key}
      end

      if value = @destination_port_range
        params.concat(value.to_query_params("#{prefix}DestinationPortRange."))
      end

      if value = @source_port_range
        params.concat(value.to_query_params("#{prefix}SourcePortRange."))
      end

      if value = @protocol
        params << {"#{prefix}Protocol", value.to_s}
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

      (@remove_fields || [] of TrafficMirrorFilterRuleField).each_with_index(1) do |item, i|
        params << {"#{prefix}RemoveField.#{i}", item.to_json_object_key}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        traffic_mirror_filter_rule_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TrafficMirrorFilterRuleId']")).not_nil!,
        traffic_direction: (n = node.xpath_node("*[local-name()='TrafficDirection']")) ? AEC::TrafficDirection.from_json_object_key?(n.content) : nil,
        rule_number: Core::XMLValue.i32(node.xpath_node("*[local-name()='RuleNumber']")),
        rule_action: (n = node.xpath_node("*[local-name()='RuleAction']")) ? AEC::TrafficMirrorRuleAction.from_json_object_key?(n.content) : nil,
        destination_port_range: node.xpath_node("*[local-name()='DestinationPortRange']").try { |n| TrafficMirrorPortRangeRequest.from_xml(n) },
        source_port_range: node.xpath_node("*[local-name()='SourcePortRange']").try { |n| TrafficMirrorPortRangeRequest.from_xml(n) },
        protocol: Core::XMLValue.i32(node.xpath_node("*[local-name()='Protocol']")),
        destination_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='DestinationCidrBlock']")),
        source_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceCidrBlock']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        remove_fields: node.xpath_nodes("*[local-name()='RemoveField']/*[local-name()='item']").compact_map { |n| AEC::TrafficMirrorFilterRuleField.from_json_object_key?(n.content) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @destination_port_range
        value.validate!
      end

      if value = @source_port_range
        value.validate!
      end
    end

    def_equals_and_hash(@traffic_mirror_filter_rule_id, @traffic_direction, @rule_number, @rule_action, @destination_port_range, @source_port_range, @protocol, @destination_cidr_block, @source_cidr_block, @description, @remove_fields, @dry_run)
  end
end
